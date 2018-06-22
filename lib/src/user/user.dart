library plato.archives.models.user;

/// The [User] class...
class User {
  final String id;

  final String username;

  final String firstName;

  final String lastName;

  final String email;

  /// The [User] constructor...
  User (
    this.id, this.username, this.firstName, this.lastName, this.email
  );
}
