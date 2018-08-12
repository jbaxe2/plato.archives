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
  User create (covariant Map<String, Object> rawUser, [String type = 'archive']) {
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
    } catch (e) {
      if (e is ImproperUser) {
        rethrow;
      }

      throw new ImproperUser ('An improper user creation error has occurred.');
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
    if (!(rawUser.containsKey ('banner.user.cwid') &&
          rawUser.containsKey ('learn.user.username') &&
          rawUser.containsKey ('password') &&
          rawUser.containsKey ('learn.user.firstName') &&
          rawUser.containsKey ('learn.user.lastName') &&
          rawUser.containsKey ('learn.user.email'))) {
      throw new ImproperUser ('Missing required session user information.');
    }

    return new SessionUser (
      rawUser['banner.user.cwid'], rawUser['learn.user.username'],
      rawUser['password'], rawUser['learn.user.firstName'],
      rawUser['learn.user.lastName'], rawUser['learn.user.email'],
      rawUser['isLtiSession']
    );
  }

  /// The [_createArchiveUser] method...
  User _createArchiveUser (Map<String, String> rawUser) {
    if (!(rawUser.containsKey ('userId') &&
          rawUser.containsKey ('username') &&
          rawUser.containsKey ('firstName') &&
          rawUser.containsKey ('lastName') &&
          rawUser.containsKey ('email'))) {
      throw new ImproperUser ('Missing required archive user information.');
    }

    return new User (
      rawUser['userId'], rawUser['username'], rawUser['firstName'],
      rawUser['lastName'], rawUser['email']
    );
  }
}
