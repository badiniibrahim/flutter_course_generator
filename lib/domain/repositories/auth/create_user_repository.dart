import 'package:course_generator/domain/entities/auth_user.dart';

abstract class CreateUserRepository {
  Future<void> createUser(AuthUser user);
}
