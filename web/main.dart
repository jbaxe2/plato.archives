library plato.archives;
import 'dart:async' show runZoned;
import 'dart:html' show window;

import 'package:angular/angular.dart';

import 'package:http/http.dart' show Client;
import 'package:http/browser_client.dart' show BrowserClient;

import 'package:plato.archives/src/_application/caching/caching_service.dart';
import 'package:plato.archives/src/_application/error/error_service.dart';
import 'package:plato.archives/src/_application/progress/progress_service.dart';
import 'package:plato.archives/src/_application/workflow/workflow_service.dart';

import 'package:plato.archives/src/archive/archives_service.dart';
import 'package:plato.archives/src/course/courses_service.dart';
import 'package:plato.archives/src/enrollment/enrollments_service.dart';
import 'package:plato.archives/src/resource/resources_service.dart';

import 'package:plato.archives/src/user/users_service.dart';
import 'package:plato.archives/src/user/authentication/authentication_service.dart';
import 'package:plato.archives/src/user/session/session_service.dart';

import 'package:plato.archives/src/plato_archives_component.template.dart' as pa;

import 'main.template.dart' as pa_main;

/// The [main] function...
void main() => (new PlatoArchives()).run();

/// The generated injector for the application services.
@GenerateInjector([
  ClassProvider (Client, useClass: BrowserClient),

  ClassProvider (ArchivesService), ClassProvider (AuthenticationService),
  ClassProvider (CachingService), ClassProvider (CoursesService),
  ClassProvider (EnrollmentsService), ClassProvider (ErrorService),
  ClassProvider (ProgressService), ClassProvider (ResourcesService),
  ClassProvider (SessionService), ClassProvider (UsersService),
  ClassProvider (WorkflowService),
])
final InjectorFactory clientInjector = pa_main.clientInjector$Injector;

/// The [PlatoArchives] class...
class PlatoArchives {
  /// The [PlatoArchives] constructor...
  PlatoArchives();

  /// The [run] method...
  void run() async {
    runZoned (() {
      runApp (pa.PlatoArchivesComponentNgFactory, createInjector: _retrieveInjector());
    }, onError: (e) {
      window.console.log ('Uncaught error:\n${e.toString()}');
    });
  }

  /// The [_retrieveInjector] method...
  InjectorFactory _retrieveInjector() => clientInjector;
}
