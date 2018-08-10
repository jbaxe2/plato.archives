library plato.archives.components.progress;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'progress_service.dart';

/// The [ProgressComponent] class...
@Component(
  selector: 'plato-progress',
  templateUrl: 'progress_component.html',
  styleUrls: ['progress_component.css'],
  directives: [
    MaterialDialogComponent, MaterialIconComponent, MaterialProgressComponent,
    ModalComponent
  ],
  providers: [ProgressService]
)
class ProgressComponent implements OnInit {
  bool isVisible;

  String message;

  final String _defaultMessage;

  final ProgressService _progressService;

  /// The [ProgressComponent] constructor...
  ProgressComponent (
    this._progressService,
    [this._defaultMessage = '(There is no current message to display.)']
  );

  /// The [ngOnInit] method...
  @override
  void ngOnInit() {
    _progressService.messageStreamController.stream.listen (
      (String theMessage) {
        message = theMessage ?? _defaultMessage;

        isVisible = (null != theMessage);
      }
    );
  }
}
