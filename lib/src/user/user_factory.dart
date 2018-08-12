library plato.archives.factory.user;

import '../_application/factory/plato_factory.dart';

import 'session/session_user.dart';

import 'improper_user.dart';
import 'user.dart';

/// The [UserFactory] class...
class UserFactory implements PlatoFactory<User> {
  /// The [UserFactory] constructor...
  UserFactory();

  /// The [create] method...
  @override
  User create (covariant Map<String, Object> rawUser, [String type = 'session']) {
    User user;

    try {
      switch (type) {
        case 'session':
          user = _createSessionUser (rawUser);
          break;
        case 'archive':
          user = _createArchiveUser (rawUser.cast());
          break;
        default: throw rawUser;
      }
    } catch (_) {
      throw new ImproperUser ('An improper user error has occurred.');
    }

    return user;
  }

  /// The [createAll] method...
  @override
  Iterable<User> createAll (
    covariant Iterable<Map<String, Object>> rawUsers, [String type = 'archive']
  ) {
    var users = new List<User>();

    try {
      rawUsers.forEach ((Map<String, Object> rawUser) {
        users.add (create (rawUser, type));
      });
    } catch (_) { rethrow; }

    return users;
  }

  /// The [_createSessionUser] method...
  SessionUser _createSessionUser (covariant Map<String, Object> rawUser) {
    return new SessionUser (
      rawUser['banner.user.cwid'], rawUser['learn.user.username'],
      rawUser['password'], rawUser['learn.user.firstName'],
      rawUser['learn.user.lastName'], rawUser['learn.user.email'],
      rawUser['isLtiSession']
    );
  }

  /// The [_createArchiveUser] method...
  User _createArchiveUser (Map<String, String> rawUser) {
    return new User (
      rawUser['userId'], rawUser['username'], rawUser['firstName'],
      rawUser['lastName'], rawUser['email']
    );
  }
}
