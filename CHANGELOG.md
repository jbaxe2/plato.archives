# plato.archives:  An archived courses viewer for Plato.

## 0.17.0
- Updated Dart SDK version and dependency constraints.
- Start of converting authentication scheme.

## 0.16.10+4
- Updated dependencies.
- Minor code formatting updates.

## 0.16.10+3
- Resource view workflow functionality.

## 0.16.10+2
- Resource refactoring and additional functionality.

## 0.16.10+1
- More work for resource view workflow functionality.

## 0.16.10
- Updated dependencies.
- Added icons to buttons to help emphasize functional meaning.
- Set up workflow stepper to allow backward movements of any completed step.
- Start of resource view workflow functionality.
- Removed the @Injectable annotation from services, as it is no longer needed.

## 0.16.9+2
- Switched order of workflow continue and go back buttons.
- Updated dependencies.

## 0.16.9+1
- Minor fixes.

## 0.16.9
- Completed content or tool type selection workflow functionality.
- Start of specific content or tool selection workflow.

## 0.16.8+1
- Continuation of content or tool type selection workflow functionality.

## 0.16.8
- Start of content or tool type selection workflow functionality.

## 0.16.7+1
- Completed course archive enrollment selection workflow functionality.

## 0.16.7
- Completed authentication and session workflow functionality.
- Finishing course archive enrollment selection workflow functionality.

## 0.16.6+4
- Some more workflow functionality relating to authentication/session.

## 0.16.6+3
- Some refactoring to resolve build issues.
- Start of really fleshing out the application; work on authentication and
session type components/services, developing the start of the workflow.

## 0.16.6+2
- Reverted services back to explicit singletons, to guarantee only one instance
per service will be run across the application.
- Added more tests.
- Some refactoring.

## 0.16.6+1
- Added a few more tests.
- Minor refactoring.

## 0.16.6
- Resolved test build errors.
- Removed deprecated service constructors, using the configured DI.
- Start of creating new tests.

## 0.16.5
- Updated Dart SDK to version 2.0.0.
- Updated dependency version constraints.
- Factored out styles from component HTML into separated files, due to style
tags now generating a warning during build processes.
- Refactored directives to explicitly include what is needed for some particular
component.

## 0.16.4+3
- Updated Dart SDK to version 2.0.0-dev.69.5.
- Updated dependency version constraints.

## 0.16.4+2
- Updated Angular-based dependencies to beta version.
- Added all services to explicitly-generated injector, with [ClassProvider].
  - This should allow for only one instance of a service to be created using
  dependency injection, without having to force services to be singleton.

## 0.16.4+1
- Fixed a grammatical error.
- Start of transitioning to new beta version of Angular 5.0.

## 0.16.4
- Created a welcome component.
- Start of fleshing out the workflow component; included authentication and
archive selection.
- Created a build file.
- Set up main to run the application, added an injector for services using
HTTP requests.

## 0.16.3+1
- Updated Dart SDK to version 2.0.0-dev.66.0.
- Updated dependency version.

## 0.16.3
- Start of creating tests.
- Refactoring across code base.

## 0.16.2
- Start of adding archive selection for faculty archive enrollments.

## 0.16.1+1
- Refactored some code for enrollment and archive modules.

## 0.16.1
- Added code for enrollment factory.
- Refactored some code for enrollment and archive modules.

## 0.16.0
- Start of creating application caching layer.
- Start of creating enrollments factory and related code.

## 0.15.4+3
- Updated dependency constraints.

## 0.15.4+2
- Updated Dart SDK to version 2.0.0-dev.65.0.
- Updated some minor styling for CodeFactor code review issues.

## 0.15.4+1
- Created a base factory for other factories to implement, and refactored
current factories to conform to the interface.

## 0.15.4
- Refactored and added code for archives, courses, enrollments, users, roster.

## 0.15.3
- Provided distinction between user, session user, and authentication controls;
refactored and added code appropriately.

## 0.15.2+1
- Additional creation of user module code.

## 0.15.2
- Start of fleshing out the user module.

## 0.15.1+2
- Added an 'isAuthenticated' getter to the authentication service.

## 0.15.1+1
- Fixed a typo.

## 0.15.1
- Added progress, workflow, and archive components/services.
- Added more code to already created components/services.
- Slight refactorings.

## 0.13.2
- Added Angular metadata annotations to services and components.

## 0.13.1
- More skeleton code to provide increased level of structure for the application.
- Start of fleshing out a little of the structure.

## 0.9.1
- Added more skeleton code for various components, services, factories, models,
etc.

## 0.5.1
- Added skeleton code for some more components.
- Reverted back to non-dated patch level versioning scheme.
  - Versioning scheme conforms to x.y.z+w, where x is major, y is minor, z is
  patch, and w is quick fix.
  - Major will be '0' until the application is ready for release.
  - Minor will typically be used to provide the amount of groups of modules,
  components, and services.  This will be reset to '0' upon major increment.
  - Patch will correspond to adding to or refactoring existing components.
  - Fix will include updating Dart SDK or dependencies, resolving typos, etc.

## 0.4.20180621
- Added some course, resource, user, and enrollment/roster components.
- Added the base error handling for the application.

## 0.1.20180621
- Changed scheme for versioning, with dated patch level.
- Established the project for an initial git commit.

## 0.0.2
- Established the start of the Plato archives viewer application.

## 0.0.1
- Initial version, set up for application.
