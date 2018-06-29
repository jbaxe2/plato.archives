library plato.archives;
import 'dart:async' show runZoned;
import 'dart:html' show window;

import 'package:angular/angular.dart';

import 'package:http/http.dart' show Client;
import 'package:http/browser_client.dart' show BrowserClient;

import 'package:plato.archives/src/plato_archives_component.template.dart' as pa;

import 'main.template.dart' as pa_main;

/// Generate the [BrowserClient] injector...
@GenerateInjector(
  [Provider (Client, useClass: BrowserClient)]
)
final InjectorFactory clientInjector = pa_main.clientInjector$Injector;

/// The [main] function...
void main() {
  runZoned (() {
    runApp (pa.PlatoArchivesNgFactory, createInjector: clientInjector);
  }, onError: (e) {
    window.console.log ('Uncaught error:\n${e.toString()}');
  });
}
