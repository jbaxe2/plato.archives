library plato.archives.components.organization.selection;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/model/ui/has_factory.dart';

import '../../_application/caching/caching_service.dart';

import '../../archive/archives_service.dart';

import '../../enrollment/faculty_enrollment.dart';

import '../item/item.dart';
import '../item/item_options.dart';
import '../item/item_component.dart';
import '../item/item_component.template.dart' as ict;

import '../organization.dart';
import '../invalid_organization.dart';

@Injectable()
ComponentFactory<ItemComponent> getItemComponentFactory (Item item) =>
  ict.ItemComponentNgFactory;

/// The [OrganizationSelectionComponent] class...
@Component(
  selector: 'organization-selection',
  templateUrl: 'organization_selection_component.html',
  directives: [MaterialTreeComponent, NgIf],
  providers: [
    ArchivesService,
    FactoryProvider (ItemComponent, getItemComponentFactory, deps: [Item]),
    popupBindings
  ]
)
class OrganizationSelectionComponent implements AfterViewInit {
  FacultyEnrollment _enrollment;

  Organization _organization;

  List<Item> items;

  ItemOptions itemOptions;

  final FactoryRenderer<ItemComponent, Item> itemsRenderer =
    getItemComponentFactory;

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  /// The [OrganizationSelectionComponent] constructor...
  OrganizationSelectionComponent (this._archivesService, this._cachingService) {
    items = new List<Item>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    try {
      _loadFromCache();
    } catch (_) {
      return;
    }

    await _loadArchiveOrganization();
    _establishItems();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (!_cachingService.haveCachedObject ('archiveEnrollment')) {
      throw new InvalidOrganization (
        'Unable to load the archive course structure.'
      );
    }

    _enrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');

    return true;
  }

  /// The [_loadArchiveOrganization] method...
  Future<void> _loadArchiveOrganization() async {
    try {
      List<Organization> organizations =
        await _archivesService.loadArchiveOrganizations (_enrollment?.courseId);

      _organization = organizations?.first;
    } catch (_) {}
  }

  /// The [_establishItems] method...
  void _establishItems() {
    if (_organization.haveItems) {
      itemOptions = new ItemOptions (
        [new OptionGroup (items = _organization?.items)]
      );
    }
  }
}
