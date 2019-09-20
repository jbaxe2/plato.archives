library plato.archives.models.item;

/// The [Item] class...
class Item {
  final String id;

  final String title;

  List<Item> _items;

  List<Item> get items => new List<Item>.from (_items);

  /// The [Item] constructor...
  Item (this.id, this.title, [List<Item> items]) {
    setItems (items);
  }

  /// The [setItems] method...
  void setItems (List<Item> items) {
    this._items = items ?? new List<Item>();
  }

  /// The [addItems] method...
  void addItems (List<Item> items) {
    this._items.addAll (items);
  }
}
