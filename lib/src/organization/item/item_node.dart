library plato.archives.models.item.node;

import 'package:angular_components/angular_components.dart';

import 'item.dart';

/// The [ItemNode] class...
class ItemNode extends Item with MaterialTreeExpandState {
  /// The [ItemNode] constructor...
  ItemNode (String id, String title) : super (id, title);
}
