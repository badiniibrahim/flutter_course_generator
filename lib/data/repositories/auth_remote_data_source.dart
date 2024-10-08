import 'package:course_generator/data/models/auth_user_model.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class AuthRemoteDataSource {
  Rx<AuthUserModel?> get user;

  Future<AuthUserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> createUser(AuthUser user);
}
