library plato.archives;
import 'dart:async' show runZoned;
import 'dart:html' show window;

import 'package:angular/angular.dart';

import 'package:http/http.dart' show Client;
import 'package:http/browser_client.dart' show BrowserClient;

import 'package:plato.archives/src/_application/error/error_service.dart';
import 'package:plato.archives/src/_application/progress/progress_service.dart';

import 'package:plato.archives/src/plato_archives_component.template.dart' as pa;

import 'main.template.dart' as pa_main;

/// The [main] function...
void main() => (new PlatoArchives()).run();

/// The [PlatoArchives] class...
class PlatoArchives {
  /// The [PlatoArchives] constructor...
  PlatoArchives();

  /// The [run] method...
  void run() {
    runZoned (() async {
      runApp (pa.PlatoArchivesNgFactory, createInjector: _createInjector());
    }, onError: (e) {
      window.console.log ('Uncaught error:\n${e.toString()}');
    });
  }

  /// The [_createInjector] method...
  InjectorFactory _createInjector() {
    @GenerateInjector([
      ClassProvider (Client, useClass: BrowserClient),
      ClassProvider (ErrorService),
      ClassProvider (ProgressService)
    ])
    InjectorFactory clientInjector = pa_main.clientInjector$Injector;

    return clientInjector;
  }
}
