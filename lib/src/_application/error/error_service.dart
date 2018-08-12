library plato.archives.services.error;

import 'dart:async' show StreamController;

import 'package:angular/core.dart' show Injectable;

import 'plato_exception.dart';

/// The [ErrorService] class...
@Injectable()
class ErrorService {
  final StreamController<PlatoException> errorStreamController =
    new StreamController<PlatoException>.broadcast();

  bool errorRaised;

  static ErrorService _instance;

  /// The [ErrorService] factory constructor...
  factory ErrorService() => _instance ?? (_instance = new ErrorService._());

  /// The [ErrorService] private constructor...
  ErrorService._();

  /// The [raiseError] method...
  void raiseError (PlatoException exception) {
    errorStreamController.add (exception);
    errorRaised = true;
  }
}
