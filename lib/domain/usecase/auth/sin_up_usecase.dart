import 'dart:async';

import 'package:course_generator/core/domain/use_case.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_up_repository.dart';

class SignUpUseCase extends UseCase<AuthUser, AuthParams> {
  final SignUpRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  @override
  FutureOr<AuthUser> call({required AuthParams params}) {
    try {
      return signUpRepository.signUp(params: params);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
