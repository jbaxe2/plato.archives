@TestOn('browser')
library plato.archives.tests.services;

import 'package:http/http.dart' show Client;
import 'package:http/browser_client.dart' show BrowserClient;

import 'package:angular/angular.dart';

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
      _testDirectlyCreatingTwoServiceInstancesAreSameObject();
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

  /// The [_testDirectlyCreatingTwoServiceInstancesAreSameObject] method...
  void _testDirectlyCreatingTwoServiceInstancesAreSameObject() {
    test (
      'Directly creating two instances of a service reference the same object.',
      () {
        var client = new BrowserClient();

        var usersService1 = new UsersService (client);
        var usersService2 = new UsersService (client);

        expect (usersService1 == usersService2, true);
      }
    );
  }
}
