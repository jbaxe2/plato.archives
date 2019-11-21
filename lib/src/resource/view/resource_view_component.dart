library plato.archives.components.resource.view;

import 'dart:async' show Future;

import 'package:angular/angular.dart';
import 'package:angular/security.dart';
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
  styleUrls: ['resource_view_component.css'],
  directives: [MaterialExpansionPanel, SafeInnerHtmlDirective, NgIf],
  providers: [
    ArchivesService, CachingService, ProgressService
  ]
)
class ResourceViewComponent implements AfterViewInit {
  Resource resource;

  SafeHtml resourceContent;

  ArchiveEnrollment _archiveEnrollment;

  Resource _selectedResource;

  bool loadingResourceFailed;

  final DomSanitizationService _sanitizationService;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final ProgressService _progressService;

  /// The [ResourceViewComponent] constructor...
  ResourceViewComponent (
    this._sanitizationService,
    this._archivesService, this._cachingService, this._progressService
  ) {
    loadingResourceFailed = false;
  }

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

      _setResourceHtml();

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
      if (_selectedResource.isCulled) {
        String cullingFocus = '';

        if (_cachingService.haveCachedObject ('cullingFocus')) {
          cullingFocus = _cachingService.retrieveCachedObject ('cullingFocus');
        }

        resource = await _archivesService.loadArchiveCulledResource (
          _archiveEnrollment.courseId, _selectedResource.type, cullingFocus
        );
      } else {
        resource = await _archivesService.loadArchiveResource (
          _archiveEnrollment.courseId, _selectedResource.id
        );
      }

      _setResourceHtml();
    } catch (_) {
      loadingResourceFailed = true;
    }

    _progressService.revoke();
  }

  /// The [_setResourceHtml] method...
  void _setResourceHtml() {
    resourceContent = _sanitizationService.bypassSecurityTrustHtml (resource.content);
  }
}
