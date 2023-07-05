import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

import '../../base/entities/test_response.entity.dart';
import '../../base/templates/test.base.dart';

class QuickbooksLineDetailTypeTests extends Test {
  QuickbooksLineDetailTypeTests() {
    name = "QuickbooksLineDetailType enum";
    testFunctions = [
      testEnum,
    ];
  }

  TestResponse testEnum() {
    var response = TestResponse(
        name: "QuickbooksLineDetailType test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    for (var value in QuickbooksLineDetailType.values) {
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
            QuickbooksLineDetailTypeExtension.fromJsonString(string);
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
