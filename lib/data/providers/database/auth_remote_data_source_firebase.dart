import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_generator/config/app_pages.dart';
import 'package:course_generator/data/models/auth_user_model.dart';
import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRemoteDataSourceFirebase implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceFirebase({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firestore = firestore ?? FirebaseFirestore.instance;

  final Rx<AuthUserModel?> _user = Rx<AuthUserModel?>(null);

  @override
  Rx<AuthUserModel?> get user => _user;

  @override
  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        throw UserNotFoundException();
      }
      _user.value = AuthUserModel.fromFirebaseAuthUser(credential.user!);
      return AuthUserModel.fromFirebaseAuthUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      throw Exception('Sign up failed: ${e.message}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      _user.value = null;
    } catch (error) {
      throw Exception('Sign out failed: $error');
    }
  }

  @override
  Future<AuthUserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      if (credential.user == null) {
        throw UserNotFoundException();
      }
      await credential.user?.sendEmailVerification();
      _user.value = AuthUserModel.fromFirebaseAuthUser(credential.user!);
      return AuthUserModel.fromFirebaseAuthUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      throw Exception('Sign up failed: ${e.message}');
    }
  }

  @override
  Future<void> createUser(AuthUser user) async {
    try {
      await firestore.collection('Users').doc(user.id).set({
        'userId': user.id,
        'name': user.name,
        'userImage': user.photoURL,
        'userEmail': user.email,
        'bank': user.bank,
        'nextFreeQuestion': user.nextFreeQuestion,
        'unlimited': user.unlimited,
        'appStatus': user.appStatus,
        'emailVerified': user.emailVerified
      });
      Get.offAllNamed(Routes.SIGN_IN);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  void _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        throw WeakPasswordException("auth_weak_password".tr);
      case 'email-already-in-use':
        throw EmailAlreadyInUseException("auth_email_already_in_use".tr);
      case 'user-not-found':
        throw UserNotFoundException("auth_user_not_found".tr);
      case 'wrong-password':
        throw WrongPasswordException("auth_wrong_password".tr);
      default:
        throw UnknownAuthException(
            e.message ?? 'Unknown authentication error.');
    }
  }
}
