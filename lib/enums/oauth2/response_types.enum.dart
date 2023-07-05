/// Enum for the supported subject types in the Quickbooks oauth2 connection
enum Oauth2ResponseTypes {
  code,
}

/// Extension to add convert methods to the response types
extension Oauth2ResponseTypesConvertExtension on Oauth2ResponseTypes {
  /// Converts a [jsonString] to a [Oauth2ResponseTypes]
  ///
  /// Throws a [RangeError] if the [jsonString] is not supported
  static Oauth2ResponseTypes fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "code":
        return Oauth2ResponseTypes.code;

      default:
        throw RangeError(
            "There's no subject type corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2ResponseTypes] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2ResponseTypes.code:
        return "code";

      default:
        throw UnimplementedError(
            "The toJsonString() method is not defined for the value $this");
    }
  }
}
