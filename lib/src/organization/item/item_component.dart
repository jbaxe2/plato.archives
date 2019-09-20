library plato.archives.components.item;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../_application/progress/progress_service.dart';
import '../../archive/archives_service.dart';

import 'item.dart';

/// The [ItemComponent] class...
@Component(
  selector: 'item',
  templateUrl: 'item_component.html',
  directives: [NgIf],
  providers: [ArchivesService, ProgressService]
)
class ItemComponent implements AfterViewInit, RendersValue<Item> {
  @override
  Item value;

  /// The [ItemComponent] constructor...
  ItemComponent();

  /// The [ngAfterViewInit] method...
  @override
  void ngAfterViewInit() {
    ;
  }
}
