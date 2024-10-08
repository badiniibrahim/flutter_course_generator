import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  SignUpRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthUser> signUp({required AuthParams params}) async {
    final authModel = await authRemoteDataSource.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return authModel.toEntity();
  }
}
