library plato.archives.factory.user;

import 'session/session_user.dart';

import 'improper_user_error.dart';
import 'user.dart';

/// The [UserFactory] class...
class UserFactory {
  /// The [UserFactory] constructor...
  UserFactory();

  /// The [createUser] method...
  User createUser (String type, Map<String, dynamic> rawUser) {
    User user;

    try {
      switch (type) {
        case 'session':
          user = _createSessionUser (rawUser);
          break;
        case 'archive':
          user = _createArchiveUser (rawUser);
          break;
        default: throw rawUser;
      }
    } catch (_) {
      throw new ImproperUserError ('An improper user error has occurred.');
    }

    return user;
  }

  /// The [_createSessionUser] method...
  SessionUser _createSessionUser (Map<String, dynamic> rawUser) {
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
