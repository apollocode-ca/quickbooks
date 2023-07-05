/// Enum for the supported subject types in the Quickbooks oauth2 connection
enum Oauth2SubjectTypes {
  public,
  private,
}

/// Extension to add convert methods to the subject types
extension Oauth2SubjectTypesConvertExtension on Oauth2SubjectTypes {
  /// Converts a [jsonString] to a [Oauth2SubjectTypes]
  ///
  /// Throws a [RangeError] if the [jsonString] is not supported
  static Oauth2SubjectTypes fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "public":
        return Oauth2SubjectTypes.public;
      case "private":
        return Oauth2SubjectTypes.private;

      default:
        throw RangeError(
            "There's no subject type corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2SubjectTypes] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2SubjectTypes.public:
        return "public";
      case Oauth2SubjectTypes.private:
        return "private";

      default:
        throw UnimplementedError(
            "The toJsonString() method is not defined for the value $this");
    }
  }
}
