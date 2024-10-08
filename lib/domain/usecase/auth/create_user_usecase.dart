import 'dart:async';

import 'package:course_generator/core/domain/use_case.dart';
import 'package:course_generator/domain/entities/auth_user.dart';
import 'package:course_generator/domain/repositories/auth/create_user_repository.dart';

class CreateUserUseCase extends UseCase<void, AuthUser> {
  final CreateUserRepository createUserRepository;
  CreateUserUseCase({required this.createUserRepository});

  @override
  FutureOr<void> call({required AuthUser params}) {
    try {
      return createUserRepository.createUser(params);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
