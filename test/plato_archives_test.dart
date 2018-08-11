@TestOn('browser')
library plato.archives.tests;

import 'package:angular_test/angular_test.dart';

import 'package:test/test.dart';

import 'services/services_test.dart' as services;

import 'testable.dart';

/// The [main] function...
void main() => (new PlatoArchivesTester()).run();

/// The [PlatoArchivesTester] class...
class PlatoArchivesTester implements Testable {
  PlatoArchivesTester();

  /// The [run] method...
  @override
  void run() {
    tearDown (disposeAnyRunningTest);

    _testDomain();
    _testServices();
    _testComponents();
  }

  /// The [_testDomain] method...
  void _testDomain() {
    ;
  }

  /// The [_testServices] method...
  void _testServices() {
    services.main();
  }

  /// The [_testComponents] method...
  void _testComponents() {
    ;
  }
}
