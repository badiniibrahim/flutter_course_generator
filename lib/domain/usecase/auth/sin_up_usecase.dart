import 'package:course_generator/core/param_usecase.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_up_repository.dart';

class SignUpUseCase extends ParamUseCase<AuthUser, AuthParams> {
  final SignUpRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  @override
  Future<AuthUser> execute(param) {
    try {
      return signUpRepository.signUp(params: param);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
