/// Enum for the supported subject types in the Quickbooks oauth2 connection
enum Oauth2SigningAlg {
  // ignore: constant_identifier_names
  RS256,
}

/// Extension to add convert methods to the signing alg
extension Oauth2SigningAlgConvertExtension on Oauth2SigningAlg {
  /// Converts a [jsonString] to a [Oauth2SigningAlg]
  ///
  /// Throws a [RangeError] if the [jsonString] is not supported
  static Oauth2SigningAlg fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "RS256":
        return Oauth2SigningAlg.RS256;

      default:
        throw RangeError(
            "There's no subject type corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2SigningAlg] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2SigningAlg.RS256:
        return "RS256";

      default:
        throw UnimplementedError(
            "The toJsonString() method is not defined for the value $this");
    }
  }
}
