/// Enum for the supported subject types in the Quickbooks oauth2 connection
enum Oauth2Claims {
  aud,
  exp,
  iat,
  iss,
  realmid,
  sub,
}

/// Extension to add convert methods to the subject types
extension Oauth2CLaimsConvertExtension on Oauth2Claims {
  /// Converts a [jsonString] to a [Oauth2Claims]
  ///
  /// Throws a [RangeError] if the [jsonString] is not supported
  static Oauth2Claims fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "aud":
        return Oauth2Claims.aud;
      case "exp":
        return Oauth2Claims.exp;
      case "iat":
        return Oauth2Claims.iat;
      case "iss":
        return Oauth2Claims.iss;
      case "realmid":
        return Oauth2Claims.realmid;
      case "sub":
        return Oauth2Claims.sub;

      default:
        throw RangeError(
            "There's no subject type corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2Claims] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2Claims.aud:
        return "aud";
      case Oauth2Claims.exp:
        return "exp";
      case Oauth2Claims.iat:
        return "iat";
      case Oauth2Claims.iss:
        return "iss";
      case Oauth2Claims.realmid:
        return "realmid";
      case Oauth2Claims.sub:
        return "sub";

      default:
        throw UnimplementedError(
            "The toJsonString() method is not defined for the value $this");
    }
  }
}
