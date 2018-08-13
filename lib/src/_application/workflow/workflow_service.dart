library plato.archives.services.workflow;

import 'package:angular/core.dart' show Injectable;

/// The [WorkflowService] class...
@Injectable()
class WorkflowService {
  bool hasAuthenticated;

  /// The [WorkflowService] constructor.....
  WorkflowService() {
    hasAuthenticated = false;
  }
}
