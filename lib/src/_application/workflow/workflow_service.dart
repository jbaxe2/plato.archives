library plato.archives.services.workflow;

import 'dart:async' show Stream, StreamController;

import 'package:angular/core.dart' show Injectable;

/// The [WorkflowService] class...
@Injectable()
class WorkflowService {
  bool _canProgressWorkflow;

  bool get canProgressWorkflow => _canProgressWorkflow;

  final StreamController<bool> _progressStreamController =
    new StreamController<bool>.broadcast();

  Stream<bool> get progressStream => _progressStreamController.stream;

  /// The [WorkflowService] constructor.....
  WorkflowService();

  /// The [markProgressedWorkflow] method...
  void markProgressedWorkflow() => _progressStreamController.add (false);

  /// The [markPatronEstablished] method...
  void markPatronEstablished() => _progressStreamController.add (true);
}
