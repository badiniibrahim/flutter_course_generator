import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/shared/rx_text_form_field.dart';
import 'package:course_generator/shared/widgets/back_button.dart';
import 'package:course_generator/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.0),
            leading: const CustomBackButton(),
          ),
          backgroundColor: Colors.white.withOpacity(0.9),
          body: SingleChildScrollView(
            child: FormBuilder(
              //  key: controller.formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "auth_create_account".tr,
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 85,
                      child: RxTextFormField(
                        maxLines: 1,
                        name: "auth_username".tr,
                        autocorrect: false,
                        controller: controller.state.userNameTextController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 85,
                      child: RxTextFormField(
                        maxLines: 1,
                        name: "auth_email".tr,
                        autocorrect: false,
                        controller: controller.state.emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 85,
                      child: RxTextFormField(
                        maxLines: 1,
                        name: "auth_password".tr,
                        autocorrect: false,
                        controller: controller.state.passwordTextController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary),
                        onPressed: () {
                          controller.signUp();
                        },
                        child: Obx(() => controller.state.isLoading
                            ? const LoadingWidget()
                            : Text(
                                "auth_sign_up".tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Sora',
                                ),
                              )),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'auth_or_text'.tr,
                              style: AppTextStyles.body,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => controller.state.isLoading
                              ? const LoadingWidget()
                              : GestureDetector(
                                  onTap: () {
                                    controller.signInWithGoogle();
                                  },
                                  child: const SquareTile(
                                      imagePath: 'assets/images/google_1.png'),
                                ),
                        )
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
