// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../enums/oauth2/oauth2.enum.export.dart';

/// Entity to get the Oauth2 configuration values from Quickbooks
class QuickbooksConnectConfiguration {
  String issuer;
  String authorizationEndpoint;
  String tokenEndpoint;
  String userInfoEndpoint;
  String revocationEndpoint;
  String jwksUri;
  List<Oauth2ResponseTypes> responseTypesSupported;
  List<Oauth2SubjectTypes> subjectTypesSupported;
  List<Oauth2SigningAlg> idTokenSigningAlgValuesSupported;
  List<Oauth2Scopes> scopesSupported;
  List<Oauth2TokenEndpointAuthMethods> tokenEndpointAuthMethodsSupported;
  List<Oauth2Claims> claimsSupported;

  QuickbooksConnectConfiguration({
    required this.issuer,
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    required this.userInfoEndpoint,
    required this.revocationEndpoint,
    required this.jwksUri,
    required this.responseTypesSupported,
    required this.subjectTypesSupported,
    required this.idTokenSigningAlgValuesSupported,
    required this.scopesSupported,
    required this.tokenEndpointAuthMethodsSupported,
    required this.claimsSupported,
  });

  QuickbooksConnectConfiguration copyWith({
    String? issuer,
    String? authorizationEndpoint,
    String? tokenEndpoint,
    String? userInfoEndpoint,
    String? revocationEndpoint,
    String? jwksUri,
    List<Oauth2ResponseTypes>? responseTypesSupported,
    List<Oauth2SubjectTypes>? subjectTypesSupported,
    List<Oauth2SigningAlg>? idTokenSigningAlgValuesSupported,
    List<Oauth2Scopes>? scopesSupported,
    List<Oauth2TokenEndpointAuthMethods>? tokenEndpointAuthMethodsSupported,
    List<Oauth2Claims>? claimsSupported,
  }) {
    return QuickbooksConnectConfiguration(
      issuer: issuer ?? this.issuer,
      authorizationEndpoint:
          authorizationEndpoint ?? this.authorizationEndpoint,
      tokenEndpoint: tokenEndpoint ?? this.tokenEndpoint,
      userInfoEndpoint: userInfoEndpoint ?? this.userInfoEndpoint,
      revocationEndpoint: revocationEndpoint ?? this.revocationEndpoint,
      jwksUri: jwksUri ?? this.jwksUri,
      responseTypesSupported:
          responseTypesSupported ?? this.responseTypesSupported,
      subjectTypesSupported:
          subjectTypesSupported ?? this.subjectTypesSupported,
      idTokenSigningAlgValuesSupported: idTokenSigningAlgValuesSupported ??
          this.idTokenSigningAlgValuesSupported,
      scopesSupported: scopesSupported ?? this.scopesSupported,
      tokenEndpointAuthMethodsSupported: tokenEndpointAuthMethodsSupported ??
          this.tokenEndpointAuthMethodsSupported,
      claimsSupported: claimsSupported ?? this.claimsSupported,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'issuer': issuer,
      'authorization_endpoint': authorizationEndpoint,
      'token_endpoint': tokenEndpoint,
      'userinfo_endpoint': userInfoEndpoint,
      'revocation_endpoint': revocationEndpoint,
      'jwks_uri': jwksUri,
      'response_types_supported':
          responseTypesSupported.map((x) => x.toJsonString()).toList(),
      'subject_types_supported':
          subjectTypesSupported.map((x) => x.toJsonString()).toList(),
      'id_token_signing_alg_values_supported': idTokenSigningAlgValuesSupported
          .map((x) => x.toJsonString())
          .toList(),
      'scopes_supported': scopesSupported.map((x) => x.toJsonString()).toList(),
      'token_endpoint_auth_methods_supported': tokenEndpointAuthMethodsSupported
          .map((x) => x.toJsonString())
          .toList(),
      'claims_supported': claimsSupported.map((x) => x.toJsonString()).toList(),
    };
  }

  /// Converts from a map value
  factory QuickbooksConnectConfiguration.fromMap(Map<String, dynamic> map) {
    return QuickbooksConnectConfiguration(
      issuer: map['issuer'] as String,
      authorizationEndpoint: map['authorization_endpoint'] as String,
      tokenEndpoint: map['token_endpoint'] as String,
      userInfoEndpoint: map['userinfo_endpoint'] as String,
      revocationEndpoint: map['revocation_endpoint'] as String,
      jwksUri: map['jwks_uri'] as String,
      responseTypesSupported: List<Oauth2ResponseTypes>.from(
        (map['response_types_supported'] as List<dynamic>)
            .map<Oauth2ResponseTypes>(
          (x) => Oauth2ResponseTypesConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
      subjectTypesSupported: List<Oauth2SubjectTypes>.from(
        (map['subject_types_supported'] as List<dynamic>)
            .map<Oauth2SubjectTypes>(
          (x) => Oauth2SubjectTypesConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
      idTokenSigningAlgValuesSupported: List<Oauth2SigningAlg>.from(
        (map['id_token_signing_alg_values_supported'] as List<dynamic>)
            .map<Oauth2SigningAlg>(
          (x) => Oauth2SigningAlgConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
      scopesSupported: List<Oauth2Scopes>.from(
        (map['scopes_supported'] as List<dynamic>).map<Oauth2Scopes>(
          (x) => Oauth2ScopesConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
      tokenEndpointAuthMethodsSupported:
          List<Oauth2TokenEndpointAuthMethods>.from(
        (map['token_endpoint_auth_methods_supported'] as List<dynamic>)
            .map<Oauth2TokenEndpointAuthMethods>(
          (x) => Oauth2TokenEndpointAuthMethodsConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
      claimsSupported: List<Oauth2Claims>.from(
        (map['claims_supported'] as List<dynamic>).map<Oauth2Claims>(
          (x) => Oauth2CLaimsConvertExtension.fromJsonString(
            jsonString: x.toString(),
          ),
        ),
      ),
    );
  }

  /// Converts to a json value
  Map<String, dynamic> toJson() => toMap();

  /// Converts from a json value
  factory QuickbooksConnectConfiguration.fromJson(String source) =>
      QuickbooksConnectConfiguration.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuickbooksOauth2Configuration(issuer: $issuer, authorizationEndpoint: $authorizationEndpoint, tokenEndpoint: $tokenEndpoint, userInfoEndpoint: $userInfoEndpoint, revocationEndpoint: $revocationEndpoint, jwksUri: $jwksUri, responseTypesSupported: $responseTypesSupported, subjectTypesSupported: $subjectTypesSupported, idTokenSigningAlgValuesSupported: $idTokenSigningAlgValuesSupported, scopesSupported: $scopesSupported, tokenEndpointAuthMethodsSupported: $tokenEndpointAuthMethodsSupported, claimsSupported: $claimsSupported)';
  }

  @override
  bool operator ==(covariant QuickbooksConnectConfiguration other) {
    if (identical(this, other)) return true;

    return other.issuer == issuer &&
        other.authorizationEndpoint == authorizationEndpoint &&
        other.tokenEndpoint == tokenEndpoint &&
        other.userInfoEndpoint == userInfoEndpoint &&
        other.revocationEndpoint == revocationEndpoint &&
        other.jwksUri == jwksUri &&
        other.responseTypesSupported == responseTypesSupported &&
        other.subjectTypesSupported == subjectTypesSupported &&
        other.idTokenSigningAlgValuesSupported ==
            idTokenSigningAlgValuesSupported &&
        other.scopesSupported == scopesSupported &&
        other.tokenEndpointAuthMethodsSupported ==
            tokenEndpointAuthMethodsSupported &&
        other.claimsSupported == claimsSupported;
  }

  @override
  int get hashCode {
    return issuer.hashCode ^
        authorizationEndpoint.hashCode ^
        tokenEndpoint.hashCode ^
        userInfoEndpoint.hashCode ^
        revocationEndpoint.hashCode ^
        jwksUri.hashCode ^
        responseTypesSupported.hashCode ^
        subjectTypesSupported.hashCode ^
        idTokenSigningAlgValuesSupported.hashCode ^
        scopesSupported.hashCode ^
        tokenEndpointAuthMethodsSupported.hashCode ^
        claimsSupported.hashCode;
  }
}
