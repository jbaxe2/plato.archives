library plato.archives.models.item;

/// The [Item] class...
class Item {
  final String id;

  final String title;

  final List<Item> items;

  /// The [Item] constructor...
  Item (this.id, this.title, this.items);
}
