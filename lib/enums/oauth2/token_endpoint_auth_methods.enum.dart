/// Enum for the supported subject types in the Quickbooks oauth2 connection
enum Oauth2TokenEndpointAuthMethods {
  clientSecretPost,
  clientSecretBasic,
}

/// Extension to add convert methods to the auth methods
extension Oauth2TokenEndpointAuthMethodsConvertExtension
    on Oauth2TokenEndpointAuthMethods {
  /// Converts a [jsonString] to a [Oauth2TokenEndpointAuthMethods]
  ///
  /// Throws a [RangeError] if the [jsonString] is not supported
  static Oauth2TokenEndpointAuthMethods fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "client_secret_post":
        return Oauth2TokenEndpointAuthMethods.clientSecretPost;
      case "client_secret_basic":
        return Oauth2TokenEndpointAuthMethods.clientSecretBasic;

      default:
        throw RangeError(
            "There's no subject type corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2TokenEndpointAuthMethods] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2TokenEndpointAuthMethods.clientSecretPost:
        return "client_secret_post";
      case Oauth2TokenEndpointAuthMethods.clientSecretBasic:
        return "client_secret_basic";

      default:
        throw UnimplementedError(
            "The toJsonString() method is not defined for the value $this");
    }
  }
}
