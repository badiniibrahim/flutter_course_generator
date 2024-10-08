import 'package:course_generator/core/param_usecase.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_in_repository.dart';

class SignInUseCase extends ParamUseCase<AuthUser, AuthParams> {
  final SignInRepository signInRepository;

  SignInUseCase({required this.signInRepository});

  @override
  Future<AuthUser> execute(param) {
    try {
      return signInRepository.signIn(params: param);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
