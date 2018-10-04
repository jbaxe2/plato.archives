library plato.archives.components.resource.view;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../archive/archives_service.dart';

import '../resource.dart';

/// The [ResourceViewComponent] class...
@Component(
  selector: 'resource-view',
  templateUrl: 'resource_view_component.html'
)
class ResourceViewComponent implements AfterViewInit {
  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final WorkflowService _workflowService;

  Resource resource;

  /// The [ResourceViewComponent] constructor...
  ResourceViewComponent (
    this._archivesService, this._cachingService, this._progressService,
    this._workflowService
  );

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    if (_loadFromCache()) {
      return;
    }

    await _loadArchiveResource();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    try {
      _loadRequiredFromCache();
    } catch (_) {}

    return false;
  }

  /// The [_loadRequiredFromCache] method...
  void _loadRequiredFromCache() {
    ;
  }

  /// The [_loadArchiveResource] method...
  Future<void> _loadArchiveResource() async {
    ;
  }
}
