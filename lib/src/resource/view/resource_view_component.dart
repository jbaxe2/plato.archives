library plato.archives.components.resource.view;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/progress/progress_service.dart';

import '../../archive/archives_service.dart';

import '../../enrollment/archive_enrollment.dart';

import '../invalid_resource.dart';
import '../resource.dart';

/// The [ResourceViewComponent] class...
@Component(
  selector: 'resource-view',
  templateUrl: 'resource_view_component.html',
  directives: const [NgIf, MaterialExpansionPanel],
  providers: const [ArchivesService, CachingService, ProgressService]
)
class ResourceViewComponent implements AfterViewInit {
  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  ArchiveEnrollment _archiveEnrollment;

  Resource _selectedResource;

  Resource resource;

  /// The [ResourceViewComponent] constructor...
  ResourceViewComponent (
    this._archivesService, this._cachingService, this._progressService
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

    if (_cachingService.haveCachedObject ('resourceView')) {
      resource = _cachingService.retrieveCachedObject ('resourceView');

      return true;
    }

    return false;
  }

  /// The [_loadRequiredFromCache] method...
  void _loadRequiredFromCache() {
    if (!(_cachingService.haveCachedObject ('archiveEnrollment') &&
          _cachingService.haveCachedObject ('selectedResource'))) {
      throw new InvalidResource (
        'Unable to retrieve a resource that has not been selected.'
      );
    }

    _archiveEnrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');
    _selectedResource = _cachingService.retrieveCachedObject ('selectedResource');
  }

  /// The [_loadArchiveResource] method...
  Future<void> _loadArchiveResource() async {
    _progressService.invoke ('Attempting to load the resource.');

    try {
      resource = await _archivesService.loadArchiveResource (
        _archiveEnrollment.courseId, _selectedResource.id
      );
    } catch (_) {}

    _progressService.revoke();
  }
}
