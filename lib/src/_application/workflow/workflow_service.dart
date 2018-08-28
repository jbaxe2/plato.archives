library plato.archives.services.workflow;

import 'dart:async' show StreamController, Stream;

import 'package:angular/core.dart' show Injectable;

/// The [WorkflowService] class...
@Injectable()
class WorkflowService {
  static StreamController<bool> _progressStreamController =
    new StreamController<bool>.broadcast();

  Stream<bool> get progressStream => _progressStreamController.stream;

  /// The [WorkflowService] constructor.....
  WorkflowService();

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
}
