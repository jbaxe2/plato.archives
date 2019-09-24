library plato.archives.models.item;

/// The [Item] class...
class Item {
  final String id;

  final String title;

  List<Item> _items;

  List<Item> get items => _items;

  /// The [Item] constructor...
  Item (this.id, this.title, [List<Item> items]) {
    setItems (items ?? new List<Item>());
  }

  /// The [setItems] method...
  void setItems (List<Item> items) {
    this._items = items;
  }

  /// The [addItem] method...
  void addItem (Item item) {
    this._items.add (item);
  }

  /// The [addItems] method...
  void addItems (List<Item> items) {
    this._items.addAll (items);
  }
}
