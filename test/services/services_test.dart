@TestOn('browser')
library plato.archives.tests.services;

import 'package:angular/angular.dart';

//import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'package:plato.archives/src/user/users_service.dart';

import '../testable.dart';

import 'services_test.template.dart' as services_tester;

void main() => (new ServicesTester()).run();

/// An injector for use with tests.
@GenerateInjector([
  ClassProvider (UsersService)
])
InjectorFactory testInjector = services_tester.testInjector$Injector;

/// The [ServicesTester] class...
class ServicesTester implements Testable {
  /// The [ServicesTester] constructor...
  ServicesTester();

  /// The [run] method...
  @override
  void run() {
    group ('Services:', () {
      _testTwoInjectedInstancesAreSameServiceObject();
    });
  }

  /// The [_testTwoInjectedInstancesAreSameServiceObject] method...
  void _testTwoInjectedInstancesAreSameServiceObject() {
    test (
      'Two service instances from the same injector reference the same object.',
      () {
        UsersService usersService1 =
          ((() => testInjector) as Injector).get (UsersService);

        UsersService usersService2 =
          ((() => testInjector) as Injector).get (UsersService);

        expect ((usersService1 == usersService2), true);
      }
    );
  }
}
