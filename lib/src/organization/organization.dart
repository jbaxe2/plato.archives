library plato.archives.models.organization;

import '../archive/manifestable.dart';

import 'item/item.dart';

/// The [Organization] class...
class Organization implements Manifestable {
  final List<Item> items;

  bool get haveItems => items.isNotEmpty;

  /// The [Organization] class...
  Organization (this.items);
}
