import 'dart:convert';
import 'package:alfred/alfred.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:quickbooks/entities/oauth2/oauth2_tokens.entity.dart';
import 'package:quickbooks/enums/oauth2/oauth2.enum.export.dart';
import 'package:quickbooks/services/configuration.service.dart';
import 'package:quickbooks/environment/quickbooks_environment.dart';

/// Service that provides Oauth2 copnnection to the Quickbooks site.
///
/// If you don't provide the needed values, it will take it in your environment variables.
class QuickbooksOauth2Service {
  late final String _clientId;
  late final String _clientSecret;
  late final String _redirectUrl;
  late final bool _isProduction;
  late final String _state;

  final QuickbooksConfigurationService _configService =
      QuickbooksConfigurationService();

  /// **Quickbooks Oauth2 connection service constructor**
  ///
  /// Takes the environment variables as needed values by default.
  ///
  /// **Parameters**
  ///
  /// [clientId] ClientId of your Quickbooks app.
  ///
  /// [clientSecret] ClientSecret of your Quickbooks app.
  ///
  /// [redirectUrl] Url where you want the Oauth2 connection to redirect.
  /// (Must be a valid url, local addresss doesn't work)(Must be registered
  /// on Quickbooks website for you app).
  ///
  /// [isProduction] Defines if you use the sandbox endpoints or the production
  /// endpoints.
  ///
  /// [state] Verification [String] for quickbooks to verify if the connection has
  /// been successfull. Can be anything.
  QuickbooksOauth2Service({
    String? clientId,
    String? clientSecret,
    String? redirectUrl,
    bool? isProduction,
    String? state,
  }) {
    _clientId = clientId ?? QuickbooksEnvironment.clientId;
    _clientSecret = clientSecret ?? QuickbooksEnvironment.clientSecret;
    _redirectUrl = redirectUrl ?? QuickbooksEnvironment.redirectUri;
    _isProduction = isProduction ?? QuickbooksEnvironment.isProduction;
    _state = state ?? QuickbooksEnvironment.state;
  }

  /// Returns the basic token of your app
  String getBasicToken() {
    return base64Encode(utf8.encode("$_clientId:$_clientSecret"));
  }

  /// Gets the auth url for a user to connect to your app with Quickbooks.
  /// The connection with this url will provide an authorization code
  /// to get the Oauth2 tokens.
  /// The [scopes] you give represents the data you ask authorization to see.
  /// If you don't specify it, the link will ask all scopes
  Future<String> getAuthUrl({List<Oauth2Scopes>? scopes}) async {
    // Gets the configuration for the current use.
    var config =
        await _configService.getConfiguration(isProduction: _isProduction);

    // Gets the oauth2 client
    var grant = oauth2.AuthorizationCodeGrant(
        _clientId,
        Uri.parse(config.authorizationEndpoint),
        Uri.parse(config.tokenEndpoint),
        secret: _clientSecret);

    // Defines the scopes to ask
    scopes ??= Oauth2Scopes.values;
    var scopesStrings =
        Oauth2ScopesConvertExtension.generateScopeStrings(scopes: scopes);

    //Gets the autorization url
    var authorizationUrl = grant.getAuthorizationUrl(Uri.parse(_redirectUrl),
        scopes: scopesStrings, state: _state);

    //Returns the authorization url string
    var urlString = authorizationUrl.toString();

    return urlString;
  }

  /// Gets the [QuickbooksOauth2Tokens] for a user with his [authorizationCode]
  Future<QuickbooksOauth2Tokens> getTokens({
    required String authorizationCode,
    String? realmId,
  }) async {
    if (realmId == "null") {
      realmId = null;
    }
    //Gets the config values
    var config =
        await _configService.getConfiguration(isProduction: _isProduction);

    //Sets the oauth connection
    var grant = oauth2.AuthorizationCodeGrant(
        _clientId,
        Uri.parse(config.authorizationEndpoint),
        Uri.parse(config.tokenEndpoint),
        secret: _clientSecret);
    var scopes = Oauth2Scopes.values;
    var scopesStrings =
        Oauth2ScopesConvertExtension.generateScopeStrings(scopes: scopes);
    grant.getAuthorizationUrl(Uri.parse(_redirectUrl),
        scopes: scopesStrings, state: _state);

    // Gets the first tokens
    var client = await grant.handleAuthorizationResponse({
      "code": authorizationCode,
      "state": _state,
      "realmid": realmId.toString(),
    });

    // Refreshes the tokens to get all needed information
    var tokens = await refreshTokens(
        refreshToken: client.credentials.refreshToken ?? "");
    tokens.companyId = realmId;
    return tokens;
  }

  /// Refreshes a user's tokens with its [refreshToken]
  Future<QuickbooksOauth2Tokens> refreshTokens({
    required String refreshToken,
  }) async {
    // Gets the config values
    var config =
        await _configService.getConfiguration(isProduction: _isProduction);

    //Refreshes the tokens
    return await http.post(Uri.parse(config.tokenEndpoint), headers: {
      'content-type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic ${getBasicToken()}'
    }, body: {
      "grant_type": "refresh_token",
      "refresh_token": refreshToken,
    }).then((response) async {
      switch (response.statusCode) {
        case 200:
          var body = jsonDecode(response.body) as Map<String, dynamic>;
          return QuickbooksOauth2Tokens.fromMap(body);
        default:
          throw AlfredException(500, 'Quickbooks error');
      }
    });
  }
}
