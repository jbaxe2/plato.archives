library plato.archives.services.authorization;

import 'dart:async' show Future, Stream, StreamController;
import 'dart:convert' show json, utf8;
import 'dart:html' show window;

import 'package:http/http.dart' show Client, Response;

import 'authorization_error.dart';

const String _AUTHENTICATE_URI = '/plato/authenticate/learn';

const String _LOGOUT_URI = '/plato/cleanup/session';

final String _REST_AUTH_URI =
  'https://bbl.westfield.ma.edu/learn/api/public/v1/oauth2/authorizationcode'
  '?redirect_uri=${Uri.encodeFull (window.location.href)}'
  '&client_id=f36e3a35-e275-4090-b2e4-f7590038dec2'
  '&response_type=code&scope=read';

/// The [AuthorizationService] class...
class AuthorizationService {
  bool _isAuthorized;

  bool get isAuthorized => _isAuthorized;

  final StreamController<bool> _authorizationController =
    new StreamController<bool>.broadcast();

  Stream<bool> get authorizationStream => _authorizationController.stream;

  final Client _http;

  static AuthorizationService _instance;

  /// The [AuthorizationService] factory constructor...
  factory AuthorizationService (Client http) =>
    _instance ?? (_instance = new AuthorizationService._ (http));

  /// The [AuthorizationService] private constructor...
  AuthorizationService._ (this._http) {
    _isAuthorized = false;
  }

  /// The [authorizeApplication] method...
  Future<void> authorizeApplication() async {
    if (isAuthorized) {
      throw new AuthorizationError ('Authorization has already completed.');
    }

    if (_haveCode()) {
      await authorizeUser();

      return;
    }

    try {
      window.location.replace (_REST_AUTH_URI);
    } catch (_) {
      throw new AuthorizationError ('Authorization for the Plato user has failed.');
    }
  }

  /// The [authorizeUser] method...
  Future<bool> authorizeUser() async {
    var location = Uri.parse (window.location.href);

    if (location.queryParameters.containsKey ('code')) {
      try {
        final Response rawAuthResponse = await _http.post (
          Uri.parse (_AUTHENTICATE_URI),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          body: {'authCode': location.queryParameters['code']}
        );

        final Map<String, dynamic> authResponse =
          json.decode (utf8.decode (rawAuthResponse.bodyBytes)) as Map;

        if (true == authResponse['learn.user.authenticated']) {
          _authorizationController.add (_isAuthorized = true);
        } else {
          throw authResponse;
        }
      } catch (_) {
        throw new AuthorizationError (
          'Establishing user context via authorization has failed.'
        );
      }

      return true;
    }

    return false;
  }

  /// The [logout] method...
  Future<void> logout() async {
    await _http.get (_LOGOUT_URI);

    _authorizationController.add (_isAuthorized = false);
  }

  /// The [_haveCode] method...
  bool _haveCode() {
    var location = Uri.parse (window.location.href);

    if (location.queryParameters.containsKey ('code')) {
      return true;
    }

    return false;
  }
}
