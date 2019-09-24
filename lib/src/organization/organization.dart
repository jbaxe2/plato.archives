library plato.archives.models.organization;

import '../archive/manifestable.dart';

import 'item/item.dart';

/// The [Organization] class...
class Organization implements Manifestable {
  List<Item> _items;

  List<Item> get items => new List<Item>.from (_items);

  bool get haveItems => _items.isNotEmpty;

  /// The [Organization] class...
  Organization (List<Item> orgItems) {
    _items = orgItems ?? new List<Item>();
  }
}
