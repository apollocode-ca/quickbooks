import 'dart:io';

/// Environment variables for Quickbooks package
class QuickbooksEnvironment {
  /// Client id key for your Quickbooks app
  static final String clientId = Platform.environment['QUICKBOOKS_CLIENT_ID'] ??
      const String.fromEnvironment('QUICKBOOKS_CLIENT_ID');

  /// CLient secret key for your Quickbooks app
  static final String clientSecret =
      Platform.environment['QUICKBOOKS_CLIENT_SECRET'] ??
          const String.fromEnvironment('QUICKBOOKS_CLIENT_SECRET');

  /// The uri you will redirect to after oauth2 sign in with Quickbooks
  static final String redirectUri =
      Platform.environment['QUICKBOOKS_REDIRECT_URI'] ??
          const String.fromEnvironment('QUICKBOOKS_REDIRECT_URI');

  /// The default confirmation state to verify oauth2 sign in communication
  static final String state = Platform.environment['QUICKBOOKS_STATE'] ??
      const String.fromEnvironment('QUICKBOOKS_STATE');

  /// Indicates if your app works in production or in sandbox
  /// Will be production by default
  static final bool isProduction =
      (Platform.environment['QUICKBOOKS_IS_PRODUCTION'] ??
              (const String.fromEnvironment('QUICKBOOKS_IS_PRODUCTION'))) !=
          "false";
}
