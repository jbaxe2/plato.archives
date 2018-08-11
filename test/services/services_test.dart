@TestOn('browser')
library plato.archives.tests.services;

import 'package:http/http.dart' show Client;
import 'package:http/browser_client.dart' show BrowserClient;

import 'package:angular/angular.dart';

//import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

import 'package:plato.archives/src/user/users_service.dart';

import '../testable.dart';

import 'services_test.template.dart' as services_tester;

/// The [main] function...
void main() => (new ServicesTester()).run();

/// An injector for use with tests.
@GenerateInjector([
  ClassProvider (UsersService),
  ClassProvider (Client, useClass: BrowserClient)
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
      _testTwoInjectedServiceInstancesAreSameObject();
    });
  }

  /// The [_testTwoInjectedServiceInstancesAreSameObject] method...
  void _testTwoInjectedServiceInstancesAreSameObject() {
    test (
      'Two service instances from the same injector reference the same object.',
      () {
        UsersService usersService1 =
          testInjector().get (UsersService);

        UsersService usersService2 =
          testInjector().get (UsersService);

        expect ((usersService1 == usersService2), true);
      }
    );
  }
}
