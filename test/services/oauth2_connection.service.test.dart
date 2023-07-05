import 'dart:io';
import 'package:quickbooks/environment/quickbooks_environment.dart';
import 'package:quickbooks/services/oauth2_connection.service.dart';

import '../base/entities/test_response.entity.dart';
import '../base/templates/test.base.dart';

class QuickbooksOauth2ConnectionServiceTests extends Test {
  QuickbooksOauth2ConnectionServiceTests() {
    name = "Quickbook oauth2 connection service tests";
    testFunctions = [testConnection];
  }

  Future<TestResponse> testConnection() async {
    var response = TestResponse(
        name: "Oauth2 Quickbooks connection test",
        date: DateTime.now(),
        status: TestResponseStatus.valid);
    try {
      var service = QuickbooksOauth2Service(
        clientId: QuickbooksEnvironment.clientId,
        clientSecret: QuickbooksEnvironment.clientSecret,
        redirectUrl: QuickbooksEnvironment.redirectUri,
        isProduction: QuickbooksEnvironment.isProduction,
      );

      var authUrl = await service.getAuthUrl();

      print('Please connect on the link below:\n');
      print(authUrl);
      print(
          "\nAfter connecting, enter the code in the console. It is in que query parameters.");
      print("The code:");
      String? code = stdin.readLineSync();
      print('You entered: $code');
      print("Now, enter the realmId. It is also in the query parameters.");
      print("The realmId:");
      String? realmId = stdin.readLineSync();
      print('You entered: $realmId');
      print("Retrieving data");

      // ignore: unused_local_variable
      var value = await service.getTokens(
          authorizationCode: code ?? "", realmId: realmId);
      print("Success!");
      print("Access token:\n");
      print(value.accessToken);
      print("\n");

      print("Refresh token:\n");
      print(value.refreshToken);
      print("\n");
    } catch (e) {
      response.status = TestResponseStatus.invalid;
      response.message = e.toString();
    }
    return response;
  }
}
