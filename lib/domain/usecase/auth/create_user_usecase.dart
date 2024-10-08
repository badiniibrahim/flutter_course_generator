import 'package:course_generator/core/void_usecase.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/create_user_repository.dart';

class CreateUserUseCase extends VoidUseCase<AuthUser> {
  final CreateUserRepository createUserRepository;
  CreateUserUseCase({required this.createUserRepository});

  @override
  Future<void> execute(AuthUser param) {
    try {
      return createUserRepository.createUser(param);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
