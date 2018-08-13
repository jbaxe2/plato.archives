library plato.archives.services.progress;

import 'dart:async' show Stream, StreamController;

import 'package:angular/core.dart' show Injectable;

/// The [ProgressService] class...
@Injectable()
class ProgressService {
  final StreamController<String> _messageStreamController =
    new StreamController<String>();

  Stream<String> get messageStream => _messageStreamController.stream;

  static ProgressService _instance;

  /// The [ProgressService] factory constructor...
  factory ProgressService() => _instance ?? (_instance = new ProgressService._());

  /// The [ProgressService] private constructor...
  ProgressService._();

  /// The [invoke] method...
  void invoke (String message) => _messageStreamController.add (
    message ?? '(Status indicator invoked with unkown message.)'
  );

  /// The [revoke] method...
  void revoke() => _messageStreamController.add (null);
}
