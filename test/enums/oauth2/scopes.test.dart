import 'package:quickbooks/enums/oauth2/oauth2.enum.export.dart';

import '../../base/entities/test_response.entity.dart';
import '../../base/templates/test.base.dart';

class Oauth2ScopesTests extends Test {
  Oauth2ScopesTests() {
    name = "OauthScopes enum";
    testFunctions = [testEnum, testGenerate];
  }

  TestResponse testEnum() {
    var response = TestResponse(
        name: "Oauth2Scopes test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    for (var value in Oauth2Scopes.values) {
      //Test of toJsonString method
      late String string;
      try {
        string = value.toJsonString();
      } on RangeError catch (e) {
        response.status = TestResponseStatus.invalid;
        response.message = e.message;
        return response;
      } catch (e) {
        response.status = TestResponseStatus.invalid;
        response.message = e.toString();
        return response;
      }
      // Test of fromJsonString method
      try {
        // ignore: unused_local_variable
        var convertValue =
            Oauth2ScopesConvertExtension.fromJsonString(jsonString: string);
      } on RangeError catch (e) {
        response.status = TestResponseStatus.invalid;
        response.message = e.message;
        return response;
      } catch (e) {
        response.status = TestResponseStatus.invalid;
        response.message = e.toString();
        return response;
      }
    }

    return response;
  }

  testGenerate() {
    var response = TestResponse(
        name: "Oauth2Scopes generate",
        date: DateTime.now(),
        status: TestResponseStatus.valid);
    List<String> scopeStrings = [];
    try {
      scopeStrings = Oauth2ScopesConvertExtension.generateScopeStrings(
          scopes: Oauth2Scopes.values);
      if (scopeStrings.length != Oauth2Scopes.values.length) {
        response.status = TestResponseStatus.invalid;
        response.message =
            "Not all the statuses strings has been generated. Before: ${Oauth2Scopes.values}, After: $scopeStrings";
        return response;
      }
    } catch (e) {
      response.status = TestResponseStatus.invalid;
      response.message = e.toString();
      return response;
    }

    try {
      var scopes = Oauth2ScopesConvertExtension.generateFromStrings(
          scopesStrings: scopeStrings);
      if (scopeStrings.length != scopes.length) {
        response.status = TestResponseStatus.invalid;
        response.message =
            "Not all the statuses has been generated. Before: $scopeStrings, After: $scopes";
        return response;
      }
    } catch (e) {
      response.status = TestResponseStatus.invalid;
      response.message = e.toString();
      return response;
    }

    return response;
  }
}
