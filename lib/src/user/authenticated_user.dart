library plato.archives.models.user.authenticated;

import 'user.dart';

/// The [AuthenticatedUser] class...
class AuthenticatedUser extends User {
  final String password;

  final bool _isLtiSession;

  bool get isLtiSession => _isLtiSession;

  static AuthenticatedUser _instance;

  /// The [AuthenticatedUser] factory constructor...
  factory AuthenticatedUser (
    String id, String username, String password, String firstName,
    String lastName, String email, [bool isLtiSession = false]
  ) {
    return _instance ?? (_instance = new AuthenticatedUser._ (
      id, username, password, firstName, lastName, email, isLtiSession
    ));
  }

  /// The [AuthenticatedUser] private constructor...
  AuthenticatedUser._ (
    String id, String username, this.password, String firstName,
    String lastName, String email, [this._isLtiSession = false]
  ) : super (id, username, firstName, lastName, email);
}
