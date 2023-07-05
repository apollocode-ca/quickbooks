// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test/test.dart';

import '../entities/test_response.entity.dart';

abstract class Test {
  late final String name;
  late final List<Function()> testFunctions;
  final Map<String, dynamic>? baseParameters;

  Test({this.baseParameters});

  Future<void> executeAllTests({bool showDescription = true}) async {
    List<TestResponse> responses = [];

    if (showDescription) {
      print("---------------------------------");
      print("$name\n");
    }

    for (var testFunction in testFunctions) {
      TestResponse response = await testFunction();
      if (showDescription) {
        print(
            "${response.name}: ${response.status} ${response.message != null ? " - Message: ${response.message}" : ""}");
      }

      responses.add(response);
    }

    if (showDescription) {
      print("---------------------------------\n");
    }

    group(name, () {
      for (var response in responses) {
        test(
          response.name,
          () {
            expect(
              response.status,
              equals(TestResponseStatus.valid),
            );
          },
        );
      }
    });
  }
}
