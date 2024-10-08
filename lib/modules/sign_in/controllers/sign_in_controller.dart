import 'package:course_generator/config/app_pages.dart';
import 'package:course_generator/core/mixins/input_validation_mixin.dart';
import 'package:course_generator/core/snackbar_helper.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/usecase/auth/sign_in_usecase.dart';
import 'package:course_generator/modules/sign_in/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignInController extends GetxController with SignInInputValidationMixin {
  final SignInUseCase signInUseCase;
  final LoginState state = LoginState();

  SignInController(this.signInUseCase);

  Future<void> signIn() async {
    state.isLoading = true;
    if (!isValidInput(
      email: state.emailTextController.text.trim(),
      password: state.passwordTextController.text.trim(),
    )) {
      state.isLoading = false;
      return;
    }
    try {
      final credential = await signInUseCase.call(
          params: AuthParams(
        email: state.emailTextController.text.trim(),
        password: state.passwordTextController.text.trim(),
      ));
      if (credential.emailVerified! == false) {
        SnackbarHelper.errorSnackBarTopCenter(
          title: 'Alert',
          message: "auth_verification_text".tr,
        );
      } else {
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
      SnackbarHelper.errorSnackBarTopCenter(
        title: 'Alert',
        message: e.toString(),
      );
    } finally {
      state.isLoading = false;
    }
  }
}
