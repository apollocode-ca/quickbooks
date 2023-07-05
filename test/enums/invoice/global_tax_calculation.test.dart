import 'package:quickbooks/enums/invoice/global_tax_calculation_type.enum.dart';

import '../../base/entities/test_response.entity.dart';
import '../../base/templates/test.base.dart';

class QuickbooksGlobalTaxCalculationTypeTests extends Test {
  QuickbooksGlobalTaxCalculationTypeTests() {
    name = "QuickbooksGlobalTaxCalculationType enum";
    testFunctions = [
      testEnum,
    ];
  }

  TestResponse testEnum() {
    var response = TestResponse(
        name: "QuickbooksGlobalTaxCalculationType test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    for (var value in QuickbooksGlobalTaxCalculationType.values) {
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
            QuickbooksGlobalTaxCalculationTypeExtension.fromJsonString(string);
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
