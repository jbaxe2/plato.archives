library plato.archives.components.workflow;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../user/authentication/authentication_component.dart';
import '../../archive/archive_selection_component.dart';

import 'workflow_service.dart';

/// The [WorkflowComponent] class...
@Component(
  selector: 'workflow',
  templateUrl: 'workflow_component.html',
  directives: [
    coreDirectives, materialDirectives,
    AuthenticationComponent, ArchiveSelectionComponent
  ],
  providers: [WorkflowService]
)
class WorkflowComponent {
  final WorkflowService _workflowService;

  /// The [WorkflowComponent] constructor...
  WorkflowComponent (this._workflowService);
}
