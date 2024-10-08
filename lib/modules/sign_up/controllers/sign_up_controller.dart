import 'package:course_generator/core/mixins/input_validation_mixin.dart';
import 'package:course_generator/core/snackbar_helper.dart';
import 'package:course_generator/domain/entities/auth_params.dart';
import 'package:course_generator/domain/usecase/auth/create_user_usecase.dart';
import 'package:course_generator/domain/usecase/auth/sin_up_usecase.dart';
import 'package:course_generator/modules/sign_up/state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController with SignUpInputValidationMixin {
  final SignUpUseCase signUpUseCase;
  final CreateUserUseCase createUserUseCase;
  final SignUpState state = SignUpState();

  SignUpController(this.signUpUseCase, this.createUserUseCase);

  Future<void> signUp() async {
    state.isLoading = true;
    if (!isValidInput(
      email: state.emailTextController.text.trim(),
      password: state.passwordTextController.text.trim(),
      username: state.userNameTextController.text.trim(),
    )) {
      state.isLoading = false;
      return;
    }
    try {
      final credential = await signUpUseCase.execute(
        AuthParams(
          email: state.emailTextController.text.trim(),
          password: state.passwordTextController.text.trim(),
          username: state.userNameTextController.text.trim(),
        ),
      );
      await createUserUseCase.execute(credential);
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
