library plato.archives.components.course;

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'course.dart';
import 'courses_service.dart';

/// The [CourseComponent] class...
@Component(
  selector: 'course',
  templateUrl: 'course_component.html',
  directives: [coreDirectives, materialDirectives],
  providers: [CoursesService]
)
class CourseComponent {
  Course course;

  final CoursesService _coursesService;

  /// The [CourseComponent] constructor...
  CourseComponent (this._coursesService);
}
