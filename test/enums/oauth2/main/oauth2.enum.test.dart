import '../../../base/templates/tests_execute.base.dart';
import 'oauth2.enum.test.dart';

export '../claims.test.dart';
export '../scopes.test.dart';
export '../signing_alg.test.dart';
export '../subject_types.test.dart';
export '../response_types.test.dart';
export '../token_endpoint_auth_methods.test.dart';

void main() {
  TestsExecute tests = TestsExecute(tests: [
    Oauth2ClaimsTests(),
    Oauth2ResponseTypesTests(),
    Oauth2ScopesTests(),
    Oauth2SigningAlgTests(),
    Oauth2SubjectTypesTests(),
    Oauth2TokenEndpointAuthMethodsTests(),
  ]);

  tests.executeTests();
}
