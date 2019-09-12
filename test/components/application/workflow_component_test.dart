@TestOn('browser')
library plato.tests.components.application.workflow;

import 'package:pageloader/pageloader.dart';
import 'package:test/test.dart';

import '../../testable.dart';

part 'workflow_component_test.g.dart';

void main() => (new WorkflowComponentTester()).run();

/// The [WorkflowComponentTester] class...
class WorkflowComponentTester implements Testable {
  /// The [WorkflowComponentTester] constructor...
  WorkflowComponentTester();

  /// The [run] method...
  @override
  void run() {
    group ('Workflow Component:', () {
      ;
    });
  }
}

/// The [WorkflowComponentPO] class...
@PageObject()
abstract class WorkflowComponentPO {
  /// The [WorkflowComponentPO] constructor...
  WorkflowComponentPO();

  /// The [WorkflowComponentPO] factory constructor...
  factory WorkflowComponentPO.create (PageLoaderElement context) =
    $WorkflowComponentPO.create;
}
