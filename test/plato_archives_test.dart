@TestOn('browser')
library plato.archives.test;

import 'package:angular_test/angular_test.dart';

import 'package:test/test.dart';

import 'package:plato.archives/src/plato_archives_component.dart';
import 'package:plato.archives/src/plato_archives_component.template.dart' as ng;

import 'testable.dart';

void main() {
  final testBed =
    NgTestBed.forComponent<PlatoArchivesComponent>(ng.PlatoArchivesNgFactory);

  NgTestFixture<PlatoArchivesComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}

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
    ;
  }

  /// The [_testComponents] method...
  void _testComponents() {
    ;
  }
}
