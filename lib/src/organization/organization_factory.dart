library plato.archives.factory.organization;

import '../_application/factory/plato_factory.dart';

import 'item.dart';
import 'organization.dart';

/// The [OrganizationFactory] class...
class OrganizationFactory implements PlatoFactory<Organization> {
  /// The [OrganizationFactory] constructor...
  OrganizationFactory();

  /// The [create] method...
  @override
  Organization create (Map<String, Object> rawOrganization, [String title]) {
    var items = new List<Item>();

    rawOrganization.forEach ((identifier, titleOrItems) {
      ;
    });

    return new Organization (items);
  }

  /// The [createAll] method...
  @override
  Iterable<Organization> createAll (
    Iterable<Map<String, Object>> rawOrganizations, [String title]
  ) {
    var organizations = new List<Organization>();

    rawOrganizations.forEach ((rawOrganization) {
      organizations.add (create (rawOrganization, title));
    });

    return organizations;
  }

  /// The [_createItem] method...
  Item _createItem (
    String identifier, String title, [Iterable<Map<String, Object>> items]
  ) {
    var childItems = new List<Item>();

    return new Item (identifier, title, childItems);
  }
}
