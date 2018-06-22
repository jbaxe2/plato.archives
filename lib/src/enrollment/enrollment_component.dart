library plato.archives.components.enrollment;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'enrollment.dart';
import 'enrollments_service.dart';

/// The [EnrollmentComponent] class...
@Component(
  selector: 'enrollment',
  templateUrl: 'enrollment_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [EnrollmentsService]
)
class EnrollmentComponent {
  Enrollment enrollment;

  final EnrollmentsService _enrollmentService;

  /// The [EnrollmentComponent] constructor...
  EnrollmentComponent (this._enrollmentService);
}
