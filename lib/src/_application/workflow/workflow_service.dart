library plato.archives.services.workflow;

import 'dart:async' show StreamController, Stream;

/// The [WorkflowService] class...
class WorkflowService {
  static StreamController<bool> _progressStreamController =
    new StreamController<bool>.broadcast();

  Stream<bool> get progressStream => _progressStreamController.stream;

  static StreamController<bool> _doStepStreamController =
    new StreamController<bool>.broadcast();

  Stream<bool> get doStepStream => _doStepStreamController.stream;

  /// The [WorkflowService] constructor.....
  WorkflowService();

  /// The [markStepRevertedInWorkflow] method...
  void markStepRevertedInWorkflow() => _progressStreamController.add (false);

  /// The [markProgressedWorkflow] method...
  void markProgressedWorkflow() => _progressStreamController.add (false);

  /// The [markPatronEstablished] method...
  void markPatronEstablished() => _progressStreamController.add (true);

  /// The [markArchiveEnrollmentSelected] method...
  void markArchiveEnrollmentSelected() => _progressStreamController.add (true);

  /// The [markResourceTypeSelected] method...
  void markResourceTypeSelected() => _progressStreamController.add (true);

  /// The [markResourceSelected] method...
  void markResourceSelected() => _progressStreamController.add (true);

  /// The [markItemSelected] method...
  void markItemSelected() => _progressStreamController.add (true);

  /// The [establishNextStep] method...
  void establishNextStep() => _doStepStreamController.add (true);
}
