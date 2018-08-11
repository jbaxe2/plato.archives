@TestOn('browser')
library plato.archives.tests;

import 'package:angular_test/angular_test.dart';

import 'package:test/test.dart';

//import 'package:plato.archives/src/plato_archives_component.dart';
//import 'package:plato.archives/src/plato_archives_component.template.dart' as ng;

import 'services/services_test.dart' as services;

import 'testable.dart';

import 'plato_archives_test.template.dart' as pat;

/// The [main] function...
void main() {
  pat.initReflector();

  (new PlatoArchivesTester()).run();
}

//{
  //final testBed =
    //NgTestBed.forComponent<PlatoArchivesComponent>(ng.PlatoArchivesNgFactory);

  //NgTestFixture<PlatoArchivesComponent> fixture;

  //setUp(() async {
  //  fixture = await testBed.create();
  //});

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
//}

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
