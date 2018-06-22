library plato.archives.services.authentication;

import 'dart:async' show Future;

import 'package:angular/core.dart';

import 'authenticated_user.dart';

const String _SESSION_URI = '/plato/retrieve/session';

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

/// The [AuthenticationService] class...
@Injectable()
class AuthenticationService {
  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  AuthenticatedUser _authenticatedUser;

  AuthenticatedUser get authenticatedUser => _authenticatedUser;

  static AuthenticationService _instance;

  /// The [AuthenticationService] factory constructor...
  factory AuthenticationService() =>
    _instance ?? (_instance = new AuthenticationService._());

  /// The [AuthenticationService] private constructor...
  AuthenticationService._() {
    _isAuthenticated = false;
  }

  /// The [checkIfSessionExists] method...
  Future<bool> checkIfSessionExists() async {
    return false;
  }

  /// The [authenticate] method...
  Future<void> authenticate (String username, String password) async {
    if (_isAuthenticated) {
      return;  // (throw error, or do nothing?)
    }
  }

  /// The [logout] method...
  Future<void> logout() async {
    if (!_isAuthenticated) {
      return;  // (throw error, or do nothing?)
    }
  }
}
