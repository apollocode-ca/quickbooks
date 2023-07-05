import 'package:quickbooks/services/configuration.service.dart';

import '../base/entities/test_response.entity.dart';
import '../base/templates/test.base.dart';

class QuickbooksConfigurationServiceTests extends Test {
  QuickbooksConfigurationServiceTests() {
    name = "Quickbook configuration service tests";
    testFunctions = [
      testGetConfigSandbox,
      testGetConfigProduction,
    ];
  }

  Future<TestResponse> testGetConfigSandbox() async {
    var response = TestResponse(
        name: "getConfiguration sandbox test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    var service = QuickbooksConfigurationService();
    try {
      // ignore: unused_local_variable
      var config = await service.getConfiguration(isProduction: false);
    } catch (e) {
      response.status = TestResponseStatus.invalid;
      response.message = e.toString();
      return response;
    }

    return response;
  }

  Future<TestResponse> testGetConfigProduction() async {
    var response = TestResponse(
        name: "getConfiguration production test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);

    var service = QuickbooksConfigurationService();
    try {
      // ignore: unused_local_variable
      var config = await service.getConfiguration(isProduction: true);
    } catch (e) {
      response.status = TestResponseStatus.invalid;
      response.message = e.toString();
      return response;
    }

    return response;
  }
}
