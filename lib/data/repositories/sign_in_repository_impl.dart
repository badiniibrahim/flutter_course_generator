import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  SignInRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthUser> signIn({required AuthParams params}) async {
    final authModel = await authRemoteDataSource.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return authModel.toEntity();
  }
}
