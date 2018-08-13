library plato.archives.services.session;

import 'dart:async' show Future;
import 'dart:convert' show json, utf8;

import 'package:angular/core.dart' show Injectable;
import 'package:http/http.dart' show Client, Response;

import 'session_error.dart';

const String _RETRIEVE_URI = '/plato/retrieve/session';

const String _CLEANUP_URI = '/plato/cleanup/session';

/// The [SessionService] class...
@Injectable()
class SessionService {
  bool _sessionExists;

  bool get sessionExists => _sessionExists;

  bool _isLtiSession;

  bool get isLtiSession => _isLtiSession;

  final Client _http;

  static SessionService _instance;

  /// The [SessionService] factory constructor...
  factory SessionService (Client http) =>
    _instance ?? (_instance = new SessionService._ (http));

  /// The [SessionService] private constructor...
  SessionService._ (this._http) {
    _sessionExists = false;
    _isLtiSession = false;
  }

  /// The [checkIfSessionExists] method...
  Future<bool> checkIfSessionExists() async {
    if (_sessionExists) {
      return true;
    }

    try {
      final Response sessionResponse = await _http.get (_RETRIEVE_URI);

      final Map<String, dynamic> rawSession =
        (json.decode (utf8.decode (sessionResponse.bodyBytes)) as Map)['session'];

      if ((rawSession.containsKey ('plato.session.exists')) &&
          (rawSession.containsKey ('learn.user.authenticated'))) {
        if ('true' == rawSession['learn.user.authenticated']) {
          _isLtiSession = true;
          _sessionExists = true;

          return true;
        }
      }
    } catch (_) {
      throw new SessionError ('Unable to determine if a user session exists.');
    }

    return false;
  }

  /// The [cleanup] method...
  Future<void> cleanup() async => await _http.get (_CLEANUP_URI);
}
