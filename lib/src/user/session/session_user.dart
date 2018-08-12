library plato.archives.models.user.session;

import '../user.dart';

/// The [SessionUser] class...
class SessionUser extends User {
  final String password;

  final bool _isLtiSession;

  bool get isLtiSession => _isLtiSession;

  static SessionUser _instance;

  /// The [SessionUser] factory constructor...
  factory SessionUser (
    String id, String username, String password, String firstName,
    String lastName, String email, [bool isLtiSession = false]
  ) {
    return _instance ?? (_instance = new SessionUser._ (
      id, username, password, firstName, lastName, email, isLtiSession
    ));
  }

  /// The [SessionUser] private constructor...
  SessionUser._ (
    String id, String username, this.password, String firstName,
    String lastName, String email, [this._isLtiSession = false]
  ) : super (id, username, firstName, lastName, email);

  /// The [clear] method...
  void clear() {
    _instance = null;
  }
}
