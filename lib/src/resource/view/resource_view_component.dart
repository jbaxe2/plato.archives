library plato.archives.components.resource.view;

import 'package:angular/angular.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../resource.dart';

/// The [ResourceViewComponent] class...
@Component(
  selector: 'resource-view',
  templateUrl: 'resource_view_component.html'
)
class ResourceViewComponent implements AfterViewInit {
  final CachingService _cachingService;

  final WorkflowService _workflowService;

  Resource resource;

  /// The [ResourceViewComponent] constructor...
  ResourceViewComponent (this._cachingService, this._workflowService);

  /// The [ngAfterViewInit] method...
  @override
  void ngAfterViewInit() {
    if (_loadFromCache()) {
      return;
    };
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    return false;
  }
}
