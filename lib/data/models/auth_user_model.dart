import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_user.dart';

class AuthUserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoURL;
  final bool? emailVerified;

  const AuthUserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoURL,
    this.emailVerified,
  });

  factory AuthUserModel.fromFirebaseAuthUser(
    User firebaseUser,
  ) {
    return AuthUserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName,
        photoURL: firebaseUser.photoURL,
        emailVerified: firebaseUser.emailVerified);
  }

  AuthUser toEntity() {
    return AuthUser(
      id: id,
      email: email,
      name: name,
      photoURL: photoURL,
      emailVerified: emailVerified,
    );
  }

  @override
  List<Object?> get props => [id, email, name, photoURL];
}
