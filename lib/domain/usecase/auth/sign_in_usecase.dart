import 'dart:async';

import 'package:course_generator/core/domain/use_case.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/sign_in_repository.dart';

class SignInUseCase extends UseCase<AuthUser, AuthParams> {
  final SignInRepository signInRepository;

  SignInUseCase({required this.signInRepository});

  @override
  FutureOr<AuthUser> call({required AuthParams params}) {
    try {
      return signInRepository.signIn(params: params);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
