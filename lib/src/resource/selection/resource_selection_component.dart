library plato.archives.components.resource.selection;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../archive/archives_service.dart';
import '../../archive/non_retrievable_archive.dart';

import '../../enrollment/faculty_enrollment.dart';

import '../typing/resource_typing.dart';

import '../resource.dart';

/// The [ResourceSelectionComponent] class...
@Component(
  selector: 'resource-selection',
  templateUrl: 'resource_selection_component.html',
  directives: [
    MaterialRadioComponent, MaterialRadioGroupComponent,
    NgIf, NgFor, NgModel
  ],
  providers: [
    ArchivesService, CachingService, ProgressService, WorkflowService
  ]
)
class ResourceSelectionComponent implements AfterViewInit {
  FacultyEnrollment archiveEnrollment;

  ResourceTyping resourceTyping;

  List<Resource> resources;

  Resource selectedResource;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final WorkflowService _workflowService;

  /// The [ResourceSelectionComponent] constructor...
  ResourceSelectionComponent (
    this._archivesService, this._cachingService, this._progressService,
    this._workflowService
  ) {
    resources = new List<Resource>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    if (_loadFromCache()) {
      return;
    }

    await _loadResourcesOfType();
  }

  /// The [resourceSelected] method...
  void resourceSelected (Resource resource) {
    _cachingService.cacheObject (_createCacheKey(), resources);
    _cachingService.cacheObject ('selectedResource', (selectedResource = resource));

    _workflowService.markResourceSelected();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    try {
      _loadRequiredFromCache();
    } catch (_) {}

    final String cacheKey = _createCacheKey();

    if (!_cachingService.haveCachedObject (cacheKey)) {
      return false;
    }

    resources = _cachingService.retrieveCachedObject (cacheKey);
    selectedResource = _cachingService.retrieveCachedObject ('selectedResource');

    _workflowService.markResourceSelected();

    return true;
  }

  /// The [_loadRequiredFromCache] method...
  void _loadRequiredFromCache() {
    if (!(_cachingService.haveCachedObject ('archiveEnrollment') &&
          _cachingService.haveCachedObject ('resourceTyping'))) {
      throw new NonRetrievableArchive (
        'Unable to review archive resources of a particular type when '
          'either no archive or resource type has been specified.'
      );
    };

    archiveEnrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');
    resourceTyping = _cachingService.retrieveCachedObject ('resourceTyping');
  }

  /// The [_loadResourcesOfType] method...
  Future<void> _loadResourcesOfType() async {
    _progressService.invoke ('Attempting to load ${resourceTyping.title} resources.');

    try {
      resources = await _archivesService.loadArchiveResourcesOfType (
        archiveEnrollment.courseId, resourceTyping.id
      );
    } catch (_) {}

    _progressService.revoke();
  }

  /// The [_createCacheKey] method...
  String _createCacheKey() =>
    '${archiveEnrollment.courseId}_${resourceTyping.id}_resources';
}
