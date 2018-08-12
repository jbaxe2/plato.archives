library plato.archives.tests.data.user;

import 'package:plato.archives/src/user/session/session_user.dart';
import 'package:plato.archives/src/user/user.dart';

/// A sample archive user.
var archive_user = new User (
  'facdemo', 'facdemo', 'faculty', 'demo', 'cit@westfield.ma.edu'
);

/// A sample session user.
var session_user = new SessionUser (
  'facdemo', 'facdemo', 'facdemo', 'faculty', 'demo', 'cit@westfield.ma.edu'
);

/// A sample raw archive user.
Map<String, String> raw_archive_user = {
  'userId': 'facdemo',
  'username': 'facdemo',
  'firstName': 'faculty',
  'lastName': 'demo',
  'email': 'cit@westfield.ma.edu'
};

/// A sample raw session user.
Map<String, String> raw_session_user = {
  'banner.user.cwid': 'facdemo',
  'learn.user.username': 'facdemo',
  'password': 'facdemo',
  'learn.user.firstName': 'faculty',
  'learn.user.lastName': 'demo',
  'learn.user.email': 'cit@westfield.ma.edu'
};

/// A sample raw LTI-based session user.
Map<String, Object> raw_lti_session_user = {
  'banner.user.cwid': 'facdemo',
  'learn.user.username': 'facdemo',
  'password': 'facdemo',
  'learn.user.firstName': 'faculty',
  'learn.user.lastName': 'demo',
  'learn.user.email': 'cit@westfield.ma.edu',
  'isLtiSession': true
};
