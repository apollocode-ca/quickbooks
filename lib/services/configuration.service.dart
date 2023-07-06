import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quickbooks/entities/oauth2/oauth2_configuration.entity.dart';
import 'package:quickbooks/environment/quickbooks_environment.dart';

/// Service to get Oauth configuration from Quickbooks
class QuickbooksConfigurationService {
  static const String _sandboxLink =
      "https://developer.api.intuit.com/.well-known/openid_sandbox_configuration";
  static const String _productionLink =
      "https://developer.api.intuit.com/.well-known/openid_configuration";

  QuickbooksConfigurationService._privateConstructor();

  /// Configuration service singleton constructor
  static final QuickbooksConfigurationService _instance =
      QuickbooksConfigurationService._privateConstructor();

  /// [QuickbooksConfigurationService] constructor.
  ///
  /// Is singleton.
  factory QuickbooksConfigurationService() {
    return _instance;
  }

  /// Gets the Oauth configuration from Quickbooks.
  ///
  /// [isProduction] Specifies if the config you want is in production or in sandbox. This will
  /// define the base endpoint url used by the service. If not given, takes the environement
  /// value QUICKBOOKS_IS_PRODUCTION or is true by default.
  Future<QuickbooksConnectConfiguration> getConfiguration(
      {bool? isProduction}) async {
    isProduction ??= QuickbooksEnvironment.isProduction;

    String uri = !isProduction ? _sandboxLink : _productionLink;

    try {
      return await http.get(
          Uri.parse(
            uri,
          ),
          headers: {
            'content-type': 'application/json',
          }).then((response) async {
        switch (response.statusCode) {
          case 200:
            var body = jsonDecode(response.body) as Map<String, dynamic>;
            var newConfig = QuickbooksConnectConfiguration.fromMap(body);
            return newConfig;
          default:
            throw StateError(
                'Failed to get configuration, error: ${response.body}');
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}
