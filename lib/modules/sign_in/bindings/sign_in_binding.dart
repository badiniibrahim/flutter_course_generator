import 'package:course_generator/data/providers/database/auth_remote_data_source_firebase.dart';
import 'package:course_generator/data/repositories/auth_remote_data_source.dart';
import 'package:course_generator/data/repositories/sign_in_repository_impl.dart';
import 'package:course_generator/domain/repositories/auth/sign_in_repository.dart';
import 'package:course_generator/domain/usecase/auth/sign_in_usecase.dart';
import 'package:course_generator/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceFirebase(),
    );
    Get.lazyPut<SignInRepository>(
      () => SignInRepositoryImpl(authRemoteDataSource: Get.find()),
    );
    Get.lazyPut<SignInUseCase>(
      () => SignInUseCase(signInRepository: Get.find()),
    );
    Get.lazyPut<SignInController>(
      () => SignInController(Get.find()),
    );
  }
}
