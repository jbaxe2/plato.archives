library plato.archives.services.authentication;

import 'dart:async' show Future;

import 'package:angular/core.dart';
import 'package:http/http.dart' show Client, Response;

import 'authentication_error.dart';
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

  final Client _http;

  static AuthenticationService _instance;

  /// The [AuthenticationService] factory constructor...
  factory AuthenticationService (Client http) =>
    _instance ?? (_instance = new AuthenticationService._ (http));

  /// The [AuthenticationService] private constructor...
  AuthenticationService._ (this._http) {
    _isAuthenticated = false;
  }

  /// The [checkIfSessionExists] method...
  Future<bool> checkIfSessionExists() async {
    if (_isAuthenticated) {
      return true;
    }

    return false;
  }

  /// The [authenticate] method...
  Future<void> authenticate (String username, String password) async {
    if (_isAuthenticated) {
      return;
    }

    if (username.isEmpty || password.isEmpty) {
      throw new AuthenticationError (
        'Cannot authenticate with a username or password.'
      );
    }
  }

  /// The [logout] method...
  Future<void> logout() async {
    if (!_isAuthenticated) {
      return;  // (throw error, or do nothing?)
    }
  }
}
