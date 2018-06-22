library plato.archives.services.workflow;

/// The [WorkflowService] class...
class WorkflowService {
  static WorkflowService _instance;

  /// The [WorkflowService] factory constructor...
  factory WorkflowService() => _instance ?? (_instance = new WorkflowService._());

  /// The [WorkflowService] private constructor...
  WorkflowService._();
}
