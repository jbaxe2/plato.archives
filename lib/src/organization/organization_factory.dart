library plato.archives.factory.organization;

import '../_application/factory/plato_factory.dart';

import 'item/item.dart';
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
    String identifier, String title, [Iterable<Map<String, Object>> items]
  ) {
    var childItems = new List<Item>();
    var item = new Item (identifier, title);

    items?.forEach ((Map<String, Object> subItems) {
      subItems?.forEach ((subIdentifier, subTitleOrItems) {
        Item subItem;

        if (subTitleOrItems is String) {
          subItem = new Item (subIdentifier, subTitleOrItems);
        } else if (subTitleOrItems is Map) {
          subItem?.addItems ([
            _createItem (subIdentifier, subItem.title, [subTitleOrItems])
          ]);
        }

        childItems.add (subItem);
      });
    });

    item.setItems (childItems);

    return item;
  }
}
