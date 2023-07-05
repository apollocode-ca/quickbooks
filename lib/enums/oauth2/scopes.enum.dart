/// Enum for the possible scopes of authorization with quickbooks
enum Oauth2Scopes {
  openid,
  email,
  profile,
  address,
  phone,
  accounting,
  payment,
}

/// Extension to add convert methods to the scopes
extension Oauth2ScopesConvertExtension on Oauth2Scopes {
  /// Converts a [jsonString] to a [Oauth2Scopes]
  ///
  /// Throws a [RangeError] if the [jsonString] doesn't correspond
  /// to any of the know values.
  static Oauth2Scopes fromJsonString({
    required String jsonString,
  }) {
    switch (jsonString) {
      case "openid":
        return Oauth2Scopes.openid;
      case "email":
        return Oauth2Scopes.email;
      case "profile":
        return Oauth2Scopes.profile;
      case "address":
        return Oauth2Scopes.address;
      case "phone":
        return Oauth2Scopes.phone;
      case "com.intuit.quickbooks.accounting":
        return Oauth2Scopes.accounting;
      case "com.intuit.quickbooks.payment":
        return Oauth2Scopes.payment;

      default:
        throw RangeError("There's no scope corresponding to $jsonString.");
    }
  }

  /// Converts the current [Oauth2Scopes] to a jsonString
  String toJsonString() {
    switch (this) {
      case Oauth2Scopes.openid:
        return "openid";
      case Oauth2Scopes.email:
        return "email";
      case Oauth2Scopes.profile:
        return "profile";
      case Oauth2Scopes.address:
        return "address";
      case Oauth2Scopes.phone:
        return "phone";
      case Oauth2Scopes.accounting:
        return "com.intuit.quickbooks.accounting";
      case Oauth2Scopes.payment:
        return "com.intuit.quickbooks.payment";

      default:
        throw UnimplementedError(
            "The toScopeString() method is not defined for the value $this");
    }
  }

  /// Generares a scope strings from desired [scopes]
  static List<String> generateScopeStrings({
    required List<Oauth2Scopes> scopes,
  }) {
    List<String> scopeStrings = [];
    for (var scope in scopes) {
      scopeStrings.add(scope.toJsonString());
    }

    return scopeStrings;
  }

  /// Generate the scopes from given [scopesStrings]
  static List<Oauth2Scopes> generateFromStrings(
      {required List<String> scopesStrings}) {
    List<Oauth2Scopes> scopes = [];

    for (var scopeString in scopesStrings) {
      try {
        var scope = Oauth2ScopesConvertExtension.fromJsonString(
            jsonString: scopeString);
        scopes.add(scope);
      } catch (_) {
        print("hey");
      }
    }

    return scopes;
  }
}
