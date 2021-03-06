# plato.archives:  An archived courses viewer for Plato.

## 0.19.2+3
- Minor refactoring.
- Minor styling changes.

## 0.19.2+2
- Added ability to load culled resources from the archive.

## 0.19.2+1
- Added attempt receipts to resource typings.

## 0.19.2
- Added usability improvements when the application fails on the server side.

## 0.19.1
- Set up a 'preferred' ordering over resource typings, to provide a better
usability experience.
- Added some styling for the grade center view.

## 0.19.0+6
- Usability improvements relating to selecting resource types.

## 0.19.0+5
- Tweaked some styling effects so that the workflow step container has a
scroller; this helps the user know better what to do.
- Minor refactoring.

## 0.19.0+4
- Resolved an issue whereby an archive course outline was loaded from the
server twice.

## 0.19.0+3
- Work on providing better interpretation and display of resource content.

## 0.19.0+2
- Work on styling effects of resources.
- Updated dependency constraints.

## 0.19.0+1
- Established the means for which the application can be launched from the
course request form.
  - Automates steps 1 and 2, and starts with pulling archive for step 3, whereby
  the archive was selected from the course request form.

## 0.19.0
- Start work on allowing application to be launched from course request form.

## 0.18.1+1
- Work on organization selection tree view.

## 0.18.1
- Updated dependencies.
- Work to resolve some issues.
  - Reviewing organization in Step 4, then clicking back to Step 2 to select a
  different archive pulled the previously selected organization.
- Minor refactoring.

## 0.18.0+2
- Updated dependencies.
- Work on organization selection proper functionality.

## 0.18.0+1
- More work on organization selection code.

## 0.18.0
- Updated dependencies.
- Start of creating organization selection component and related code.
- Minor refactoring.

## 0.17.5+1
- Minor refactoring.

## 0.17.5
- Pruning of non-needed components/services created early in the project.
  - This does not include resource types that have not yet been fleshed out,
  only parts that will not be fleshed out.

## 0.17.4+3
- Updated Dart SDK lower constraint to version 2.5.0.
- Updated dependency constraints.

## 0.17.4+2
- Reverted back so that the resource type is not Base64 encoded.

## 0.17.4+1
- Base64 encoded the resource type when sending it to inspect archive API.

## 0.17.4
- Updated Dart SDK and dependency constraints.

## 0.17.3+5
- Updated Dart SDK lower constraint to version 2.2.0.
- Updated dependency constraints.

## 0.17.3+4
- Minor updates to CSS class names for resource view to reflect changes coming
from server code.

## 0.17.3+3
- Updated Dart SDK constraint.

## 0.17.3+2
- Updated dependency constraints.

## 0.17.3+1
- Removed 'const' keyword from component annotations.

## 0.17.3
- Updated some resource view features.

## 0.17.2+2
- Updated dependency constraints.
- Finished work towards authorization scheme changes.

## 0.17.2+1
- Updated dependency constraints.

## 0.17.2
- Updated dependency constraints.
- More work toward converting authentication scheme.angular

## 0.17.1+1
- Resolved a build issue for authorization.
- Continuation of converting authentication scheme.

## 0.17.1
- Continuation of converting authentication scheme.

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
