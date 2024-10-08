import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoURL;
  final String? appStatus;
  final int bank;
  final bool? unlimited;
  final DateTime? nextFreeQuestion;
  final bool? emailVerified;

  const AuthUser(
      {required this.id,
      required this.email,
      this.name,
      this.photoURL,
      this.appStatus,
      this.bank = 0,
      this.unlimited,
      this.nextFreeQuestion,
      this.emailVerified});

  static const AuthUser empty = AuthUser(
      id: '',
      name: '',
      email: '',
      photoURL: '',
      appStatus: '',
      bank: 0,
      unlimited: false,
      nextFreeQuestion: null,
      emailVerified: false);

  bool get isEmpty => this == AuthUser.empty;

  bool get adFree {
    return unlimited == true;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        photoURL,
        appStatus,
        bank,
        unlimited,
        nextFreeQuestion,
        emailVerified
      ];
}
