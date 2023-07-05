import 'test.base.dart';

class TestsExecute {
  late final List<Test> _syncTests;

  TestsExecute({
    required List<Test> tests,
  }) {
    _syncTests = tests;
  }

  Future<void> executeTests({bool showDescription = true}) async {
    for (var test in _syncTests) {
      await test.executeAllTests(showDescription: showDescription);
    }
  }
}
