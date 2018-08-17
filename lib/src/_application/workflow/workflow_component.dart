library plato.archives.components.workflow;

import 'dart:html' show Event, window;

import 'package:angular/angular.dart';

import 'package:angular_components/angular_components.dart';

import '../../_application/patron/patron_component.dart';
import '../../archive/archive_selection_component.dart';

import 'workflow_service.dart';

/// The [WorkflowComponent] class...
@Component(
  selector: 'workflow',
  templateUrl: 'workflow_component.html',
  styleUrls: ['workflow_component.css'],
  directives: [
    MaterialButtonComponent, MaterialStepperComponent, StepDirective,
    ArchiveSelectionComponent, PatronComponent,
    NgIf
  ],
  providers: [WorkflowService]
)
class WorkflowComponent implements AfterViewInit {
  bool _canStep;

  bool get canStep => _canStep;

  final WorkflowService _workflowService;

  /// The [WorkflowComponent] constructor...
  WorkflowComponent (this._workflowService) {
    _canStep = false;
  }

  @ViewChild("workflowStepper")
  MaterialStepperComponent stepper;

  /// The [ngAfterViewInit] method...
  @override
  void ngAfterViewInit() {
    _workflowService.progressStream.listen (
      (bool stepMarked) => _canStep = stepMarked
    );
  }

  /// The [progressInWorkflow] method...
  void progressInWorkflow (Event event) {
    stepper.stepForward (event, stepper.steps[stepper.activeStepIndex + 1]);
    _workflowService.markProgressedWorkflow();
  }

  /// The [goBackInWorkflow] method...
  void goBackInWorkflow (Event event) {
    if (stepper.activeStep.isFirst) {
      return;
    }

    stepper.stepBackward (event, stepper.steps[stepper.activeStepIndex - 1]);
    _canStep = true;
  }
}
