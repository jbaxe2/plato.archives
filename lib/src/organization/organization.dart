library plato.archives.models.organization;

import '../archive/manifestable.dart';

import 'item.dart';

/// The [Organization] class...
class Organization implements Manifestable {
  final List<Item> items;

  /// The [Organization] class...
  Organization (this.items);
}
