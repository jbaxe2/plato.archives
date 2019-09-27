library plato.archives.factory.organization;

import '../_application/factory/plato_factory.dart';

import 'item/item.dart';
import 'item/item_node.dart';

import 'organization.dart';

/// The [OrganizationFactory] class...
class OrganizationFactory implements PlatoFactory<Organization> {
  /// The [OrganizationFactory] constructor...
  OrganizationFactory();

  /// The [create] method...
  @override
  Organization create (Map<String, Object> rawOrganization, [String title]) {
    var items = new List<Item>();

    rawOrganization?.forEach ((identifier, titleOrItems) {
      items.add (_createItem (identifier, title, titleOrItems));
    });

    return new Organization (items);
  }

  /// The [createAll] method...
  @override
  Iterable<Organization> createAll (
    Iterable<Map<String, Object>> rawOrganizations, [String title]
  ) {
    var organizations = new List<Organization>();

    rawOrganizations?.forEach ((rawOrganization) {
      organizations.add (create (rawOrganization, title));
    });

    return organizations;
  }

  /// The [_createItem] method...
  Item _createItem (
    String identifier, String title, [Object titleOrItems]
  ) {
    Item item;

    if (titleOrItems is String) {
      if ((titleOrItems as String).startsWith ('divider_')) {
        titleOrItems = '------------------------';
      }

      item = new ItemNode (identifier, titleOrItems);
    } else if (titleOrItems is Map) {
      var itemTitle = titleOrItems[identifier] as String;
      item = new ItemNode (identifier, itemTitle);

      titleOrItems.cast<String, Object>().forEach ((subIdentifier, subTitleOrItems) {
        if (subTitleOrItems is String) {
          item.addItem (new ItemNode (subIdentifier, subTitleOrItems));
        } else if (subTitleOrItems is Map) {
          item.addItem (_createItem (subIdentifier, title, subTitleOrItems));
        }
      });
    }

    return item;
  }
}
