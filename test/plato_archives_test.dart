@TestOn('browser')
library plato.archives.test;

import 'package:angular_test/angular_test.dart';

import 'package:test/test.dart';

import 'package:plato.archives/src/plato_archives_component.dart';
import 'package:plato.archives/src/plato_archives.template.dart' as ng;

void main() {
  final testBed =
    NgTestBed.forComponent<PlatoArchivesComponent>(ng.PlatoArchivesNgFactory);

  NgTestFixture<PlatoArchivesComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}
