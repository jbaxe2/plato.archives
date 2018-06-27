library plato.archives.services.progress;

import 'dart:async' show StreamController;

import 'package:angular/core.dart' show Injectable;

/// The [ProgressService] class...
@Injectable()
class ProgressService {
  StreamController<String> messageStreamController;

  static ProgressService _instance;

  /// The [ProgressService] factory constructor...
  factory ProgressService() =>
    _instance ?? (_instance = new ProgressService._());

  /// The [ProgressService] private constructor...
  ProgressService._() {
    messageStreamController = new StreamController<String>.broadcast();
  }

  /// The [invoke] method...
  void invoke (String message) => messageStreamController.add (
    message ?? '(Status indicator invoked with unkown message.)'
  );

  /// The [revoke] method...
  void revoke() => messageStreamController.add (null);
}
