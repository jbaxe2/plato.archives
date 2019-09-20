library plato.archives.components.archive.part;

import 'package:angular/angular.dart';

import '../../_application/caching/caching_service.dart';

import '../../organization/selection/organization_selection_component.dart';

import '../../resource/selection/resource_selection_component.dart';
import '../../resource/typing/resource_typing.dart';

import 'improper_archive_part.dart';

const String _ORGANIZATIONS_TYPE = 'course/x-bb-outline';

/// The [ArchivePartComponent] class...
@Component(
  selector: 'archive-part',
  templateUrl: 'archive_part_component.html',
  directives: [
    OrganizationSelectionComponent, ResourceSelectionComponent,
    NgIf
  ],
  providers: [CachingService]
)
class ArchivePartComponent implements AfterViewInit {
  ResourceTyping _typing;

  bool get isForOrganizations => _ORGANIZATIONS_TYPE == _typing?.id;

  final CachingService _cachingService;

  /// The [ArchivePartComponent] constructor...
  ArchivePartComponent (this._cachingService);

  /// The [ngAfterViewInit] method...
  Future<void> ngAfterViewInit() async {
    try {
      _loadFromCache();
    } catch (_) {
      return;
    }
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('resourceTyping')) {
      throw new ImproperArchivePart (
        'Unable to determine which archive part to review.'
      );
    }

    _typing = _cachingService.retrieveCachedObject ('resourceTyping');

    return true;
  }
}
