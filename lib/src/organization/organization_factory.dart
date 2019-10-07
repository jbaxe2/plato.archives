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
  Organization create (
    Map<String, Object> rawOrganization, [String title = 'Archive Course Structure']
  ) {
    var archiveItemNode = new ItemNode ('res00001', '$title [click to expand]');

    rawOrganization?.forEach ((identifier, titleOrItems) {
      archiveItemNode.items.add (_createItem (identifier, titleOrItems));
    });

    return new Organization ([archiveItemNode]);
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
  Item _createItem (String identifier, Object titleOrItems) {
    Item item;

    if (titleOrItems is String) {
      item = new ItemNode (identifier, titleOrItems);
    } else if (titleOrItems is Map) {
      var itemTitle = titleOrItems[identifier] as String;
      item = new ItemNode (identifier, itemTitle ?? '[click to expand]');

      if (1 < titleOrItems.keys.length) {
        titleOrItems.cast<String, Object>().forEach (
          (subIdentifier, subTitleOrItems) {
            if (subTitleOrItems is Map) {
              item.addItem (_createItem (subIdentifier, subTitleOrItems));
            }
          }
        );
      }
    }

    return item;
  }
}
