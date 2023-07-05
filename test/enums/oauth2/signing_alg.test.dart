import 'package:quickbooks/enums/oauth2/oauth2.enum.export.dart';

import '../../base/entities/test_response.entity.dart';
import '../../base/templates/test.base.dart';

class Oauth2SigningAlgTests extends Test {
  Oauth2SigningAlgTests() {
    name = "Oauth2SigningAlg enum";
    testFunctions = [
      testEnum,
    ];
  }

  TestResponse testEnum() {
    var response = TestResponse(
        name: "Oauth2SigningAlg test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    for (var value in Oauth2SigningAlg.values) {
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
            Oauth2SigningAlgConvertExtension.fromJsonString(jsonString: string);
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
}
