import 'package:course_generator/core/snackbar_helper.dart';
import 'package:get/get.dart';

mixin SignUpInputValidationMixin {
  bool isValidInput({
    required String email,
    required String password,
    required String username,
  }) {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      SnackbarHelper.errorSnackBarTopCenter(
        title: 'Alert',
        message: "auth_empty_fields".tr,
      );
      return false;
    }
    return true;
  }
}

mixin SignInInputValidationMixin {
  bool isValidInput({
    required String email,
    required String password,
  }) {
    if (email.isEmpty || password.isEmpty) {
      SnackbarHelper.errorSnackBarTopCenter(
        title: 'Alert',
        message: "auth_empty_fields".tr,
      );
      return false;
    }
    return true;
  }
}
