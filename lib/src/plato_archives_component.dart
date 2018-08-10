library plato.archives.components.plato_archives;

import 'package:angular/angular.dart';
//import 'package:angular_components/angular_components.dart';

import '_application/welcome/welcome_component.dart';
import '_application/workflow/workflow_component.dart';

/// The [PlatoArchivesComponent] class...
@Component(
  selector: 'plato-archives',
  templateUrl: 'plato_archives_component.html',
  styleUrls: ['plato_archives_component.css'],
  directives: [
    WelcomeComponent, WorkflowComponent
  ],
  providers: []
)
class PlatoArchivesComponent {
  /// The [PlatoArchivesComponent] constructor...
  PlatoArchivesComponent();
}
