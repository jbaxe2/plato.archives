library plato.archives.components.item;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'item.dart';

/// The [ItemComponent] class...
@Component(
  selector: 'item',
  templateUrl: 'item_component.html',
)
class ItemComponent implements RendersValue<Item> {
  @override
  Item value;

  /// The [ItemComponent] constructor...
  ItemComponent();
}
