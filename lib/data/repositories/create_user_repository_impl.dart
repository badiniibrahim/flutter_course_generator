import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/create_user_repository.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  CreateUserRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<void> createUser(AuthUser user) async {
    await authRemoteDataSource.createUser(user);
  }
}
