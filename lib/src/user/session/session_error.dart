library plato.archives.error.session;

import '../../_application/error/plato_exception.dart';

/// The [SessionError] class...
class SessionError extends PlatoException {
  /// The [SessionError] constructor...
  SessionError (
    [String message = 'An unknown session error has occurred.']
  ) : super (message);
}
