library plato.archives.components.resource.selection;

import 'package:angular/angular.dart';

import '../../_application/workflow/workflow_service.dart';

/// The [ResourceSelection] class...
@Component(
  selector: 'resource-selection',
  templateUrl: 'resource_selection.html',
  providers: [WorkflowService]
)
class ResourceSelection {
  final WorkflowService _workflowService;

  /// The [ResourceSelection] constructor...
  ResourceSelection (this._workflowService);
}
