import 'base/templates/tests_execute.base.dart';
import 'enums/invoice/detail_type.test.dart';
import 'enums/invoice/global_tax_calculation.test.dart';
import 'enums/oauth2/main/oauth2.enum.test.dart';

void main() async {
  TestsExecute tests = TestsExecute(tests: [
    Oauth2ClaimsTests(),
    Oauth2ResponseTypesTests(),
    Oauth2ScopesTests(),
    Oauth2SigningAlgTests(),
    Oauth2SubjectTypesTests(),
    Oauth2TokenEndpointAuthMethodsTests(),
    QuickbooksGlobalTaxCalculationTypeTests(),
    QuickbooksLineDetailTypeTests(),
  ]);
  await tests.executeTests();
}
