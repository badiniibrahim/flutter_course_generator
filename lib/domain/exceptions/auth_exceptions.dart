class WeakPasswordException implements Exception {
  final String message;

  WeakPasswordException([this.message = 'Le mot de passe est trop faible.']);

  @override
  String toString() => message;
}

class EmailAlreadyInUseException implements Exception {
  final String message;

  EmailAlreadyInUseException([this.message = 'L\'email est déjà utilisé.']);

  @override
  String toString() => message;
}

class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException([this.message = 'Aucun utilisateur trouvé.']);

  @override
  String toString() => message;
}

class WrongPasswordException implements Exception {
  final String message;

  WrongPasswordException([this.message = 'Le mot de passe est incorrect.']);

  @override
  String toString() => message;
}

class UnknownAuthException implements Exception {
  final String message;

  UnknownAuthException([this.message = 'Erreur d\'authentification inconnue.']);

  @override
  String toString() => message;
}
