import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';

abstract class SignInRepository {
  Future<AuthUser> signIn({
    required AuthParams params,
  });
}
