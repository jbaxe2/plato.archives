library plato.archives.components.plato_archives;

import 'dart:async' show Future;
import 'dart:html' show window;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:angular_components/utils/browser/dom_service/angular_2.dart';
import 'package:angular_components/utils/angular/scroll_host/angular_2.dart';

import '_application/error/error_component.dart';
import '_application/progress/progress_component.dart';
import '_application/welcome/welcome_component.dart';
import '_application/workflow/workflow_component.dart';

import 'user/session/session_service.dart';

/// The [PlatoArchivesComponent] class...
@Component(
  selector: 'plato-archives',
  templateUrl: 'plato_archives_component.html',
  styleUrls: ['plato_archives_component.css'],
  directives: [
    ErrorComponent, ProgressComponent, WelcomeComponent, WorkflowComponent
  ],
  providers: [
    materialProviders, domServiceBinding, scrollHostProviders,
    SessionService
  ]
)
class PlatoArchivesComponent implements OnInit {
  final SessionService _sessionService;

  /// The [PlatoArchivesComponent] constructor...
  PlatoArchivesComponent (this._sessionService);

  /// The [ngOnInit] method...
  @override
  Future<void> ngOnInit() async {
    window
      ..onBeforeUnload.listen ((_) async => await _sessionService.cleanup())
      ..onUnload.listen ((_) async {
          if (_sessionService.sessionExists) {
            await _sessionService.cleanup();
          }
        });
  }
}
