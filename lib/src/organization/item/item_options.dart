library plato.archives.models.item.options;

import 'package:angular_components/angular_components.dart';

import 'item_node.dart';

/// The [ItemOptions] class...
class ItemOptions extends SelectionOptions<ItemNode>
    implements Parent<ItemNode, List<OptionGroup<ItemNode>>> {
  /// The [ItemOptions] constructor...
  ItemOptions (List<OptionGroup<ItemNode>> itemOptions) : super (itemOptions);

  /// The [hasChildren] method...
  @override
  bool hasChildren (ItemNode item) => item?.items?.isNotEmpty;

  /// The [childrenOf] method...
  @override
  DisposableFuture<List<OptionGroup<ItemNode>>> childrenOf (parentItem, [_]) =>
    new DisposableFuture.fromValue ([new OptionGroup (parentItem?.items)]);
}
