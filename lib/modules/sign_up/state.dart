import 'package:course_generator/data/models/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SignUpState {
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final Rxn<Account> _account = Rxn<Account>();
  set account(value) => _account.value = value;
  Account? get account => _account.value;

  final Rx<TextEditingController> _emailTextController =
      TextEditingController().obs;
  TextEditingController get emailTextController => _emailTextController.value;

  final Rx<TextEditingController> _userNameTextController =
      TextEditingController().obs;
  TextEditingController get userNameTextController =>
      _userNameTextController.value;

  final Rx<TextEditingController> _passwordTextController =
      TextEditingController().obs;
  TextEditingController get passwordTextController =>
      _passwordTextController.value;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get formKey => _formKey;
}
