library plato.archives.components.archive.typing;

import 'dart:async' show Future;

import 'package:angular/angular.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../archive/archives_service.dart';
import '../../archive/non_retrievable_archive.dart';

import '../../enrollment/faculty_enrollment.dart';

import 'resource_typing.dart';

/// The [ResourceTypingComponent] class...
@Component(
  selector: 'resource-typing',
  templateUrl: 'resource_typing_component.html',
  providers: [
    ArchivesService, CachingService, ProgressService, WorkflowService
  ]
)
class ResourceTypingComponent implements AfterViewInit {
  FacultyEnrollment archiveEnrollment;

  List<ResourceTyping> resourceTypings;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  final WorkflowService _workflowService;

  /// The [ResourceTypingComponent] constructor...
  ResourceTypingComponent (
    this._archivesService, this._cachingService, this._progressService,
    this._workflowService
  ) {
    resourceTypings = new List<ResourceTyping>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    try {
      if (_loadFromCache()) {
        return;
      }

      await _loadArchiveResourceTypes();
    } catch (_) {}
  }

  /// The [resourceTypeSelected] method...
  void resourceTypeSelected (event) {
    _workflowService.markArchiveTypeSelected();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('archiveEnrollment')) {
      throw new NonRetrievableArchive (
        'Unable to load part types of an archive when no archive has been selected.'
      );
    }

    archiveEnrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');
    String cachedArchiveTypes = '${archiveEnrollment.id}_resource_types';

    if (!_cachingService.haveCachedObject (cachedArchiveTypes)) {
      return false;
    }

    resourceTypings = _cachingService.retrieveCachedObject (cachedArchiveTypes)
      as List<ResourceTyping>;

    return true;
  }

  /// The [_loadArchiveResourceTypes] method...
  Future<void> _loadArchiveResourceTypes() async {
    _progressService.invoke ('Attempting to load archive content and tool types.');

    try {
      resourceTypings = await _archivesService.loadArchiveResourceTypes();

      _cachingService.cacheObject (
        '${archiveEnrollment.id}_resource_types', resourceTypings
      );
    } catch (_) {}

    _progressService.revoke();
  }
}
