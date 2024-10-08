import 'package:course_generator/data/providers/database/auth_remote_data_source_firebase.dart';
import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/data/repositories/create_user_repository_impl.dart';
import 'package:course_generator/data/repositories/sign_up_repository_impl.dart';
import 'package:course_generator/domain/repositories/auth/create_user_repository.dart';
import 'package:course_generator/domain/repositories/auth/sign_up_repository.dart';
import 'package:course_generator/domain/usecase/auth/create_user_usecase.dart';
import 'package:course_generator/domain/usecase/auth/sin_up_usecase.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceFirebase(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceFirebase(),
    );

    Get.lazyPut<SignUpRepository>(
      () => SignUpRepositoryImpl(authRemoteDataSource: Get.find()),
    );
    Get.lazyPut<CreateUserRepository>(
      () => CreateUserRepositoryImpl(authRemoteDataSource: Get.find()),
    );
    Get.lazyPut<SignUpUseCase>(
      () => SignUpUseCase(signUpRepository: Get.find()),
    );
    Get.lazyPut<CreateUserUseCase>(
      () => CreateUserUseCase(createUserRepository: Get.find()),
    );

    Get.lazyPut<SignUpController>(
      () => SignUpController(Get.find(), Get.find()),
    );
  }
}
