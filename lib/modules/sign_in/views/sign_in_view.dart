import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_pages.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:course_generator/shared/rx_text_form_field.dart';
import 'package:course_generator/shared/widgets/loading_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          body: SingleChildScrollView(
            child: FormBuilder(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .1),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "auth_welcome".tr,
                      style: AppTextStyles.title,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "auth_welcome_sub_title".tr,
                      style: AppTextStyles.body,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 85,
                      child: RxTextFormField(
                        maxLines: 1,
                        name: "auth_email".tr,
                        autocorrect: false,
                        obscureText: false,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "auth_home_tex".tr,
                              style: AppTextStyles.body,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .04),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        onPressed: () {
                          controller.signIn();
                        },
                        child: Obx(
                          () => controller.state.isLoading
                              ? const LoadingWidget()
                              : Text(
                                  "auth_sign_in_text".tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Sora',
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
                    GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: "auth_no_account".tr,
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.SIGN_UP);
                                },
                              text: "auth_sign_up_tex".tr,
                              style: AppTextStyles.body,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
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
                          () => controller.state.isLoadingGoogle
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
