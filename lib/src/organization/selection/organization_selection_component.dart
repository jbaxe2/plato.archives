library plato.archives.components.organization.selection;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/model/ui/has_factory.dart';

import '../../_application/caching/caching_service.dart';
import '../../_application/workflow/workflow_service.dart';

import '../../archive/archives_service.dart';

import '../../enrollment/faculty_enrollment.dart';

import '../../resource/resource.dart';

import '../item/item.dart';
import '../item/item_options.dart';
import '../item/item_component.dart';
import '../item/item_component.template.dart' as ict;
import '../item/item_node.dart';

import '../organization.dart';

@Injectable()
ComponentFactory<ItemComponent> getItemComponentFactory (Item item) =>
  ict.ItemComponentNgFactory;

/// The [OrganizationSelectionComponent] class...
@Component(
  selector: 'organization-selection',
  templateUrl: 'organization_selection_component.html',
  directives: [MaterialTreeComponent, NgIf],
  providers: [
    ArchivesService, CachingService, WorkflowService,
    FactoryProvider (ItemComponent, getItemComponentFactory, deps: [Item])
  ],
)
class OrganizationSelectionComponent implements AfterViewInit {
  FacultyEnrollment _enrollment;

  Organization _organization;

  List<Item> items;

  ItemOptions itemOptions;

  final FactoryRenderer<ItemComponent, Item> itemsRenderer = getItemComponentFactory;

  final SelectionModel singleSelection = new SelectionModel.single();

  final ArchivesService _archivesService;

  final CachingService _cachingService;

  final WorkflowService _workflowService;

  /// The [OrganizationSelectionComponent] constructor...
  OrganizationSelectionComponent (
    this._archivesService, this._cachingService, this._workflowService
  ) {
    items = new List<ItemNode>();
  }

  /// The [ngAfterViewInit] method...
  @override
  Future<void> ngAfterViewInit() async {
    _workflowService.markStepRevertedInWorkflow();

    if (!_loadFromCache()) {
      return;
    }

    if (null == _organization) {
      await _loadArchiveOrganization();
    }

    _establishItems();
    _listenForSelection();
  }

  /// The [_loadFromCache] method...
  bool _loadFromCache() {
    if (_cachingService.haveCachedObject ('archiveEnrollment')) {
      _enrollment = _cachingService.retrieveCachedObject ('archiveEnrollment');

      String orgEnrollment = 'organization_${_enrollment.courseId}';

      if (_cachingService.haveCachedObject (orgEnrollment)) {
        _organization = _cachingService.retrieveCachedObject (orgEnrollment);
      }

      return true;
    }

    return false;
  }

  /// The [_loadArchiveOrganization] method...
  Future<void> _loadArchiveOrganization() async {
    try {
      List<Organization> organizations =
        await _archivesService.loadArchiveOrganizations (
          _enrollment.courseId, _enrollment.courseName
        );

      _organization = organizations.first;

      String orgEnrollment = 'organization_${_enrollment.courseId}';

      _cachingService.cacheObject (orgEnrollment, _organization);
    } catch (_) {}
  }

  /// The [_establishItems] method...
  void _establishItems() {
    if (_organization.haveItems) {
      items
        ..clear()
        ..addAll (_organization.items);

      itemOptions = new ItemOptions ([new OptionGroup<ItemNode> (items)]);
    }
  }

  /// The [_listenForSelection] method...
  void _listenForSelection() {
    singleSelection.selectionChanges.listen (
      (List<SelectionChangeRecord<dynamic>> changedSelections) {
        SelectionChangeRecord changedSelection = changedSelections.first;

        if (changedSelection.removed.isNotEmpty) {
          _workflowService.markStepRevertedInWorkflow();
        }

        if (changedSelection.added.isNotEmpty) {
          var itemSelection = changedSelection.added.first as ItemNode;
          var idResource = new Resource (itemSelection.id, null, null, null, null);

          _cachingService.cacheObject ('selectedResource', idResource);
          _workflowService.markItemSelected();
        }
      }
    );
  }
}
