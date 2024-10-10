import 'package:course_generator/config/app_colors.dart';
import 'package:course_generator/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class RxTextFormField extends StatelessWidget {
  const RxTextFormField({
    super.key,
    required this.name,
    required this.controller,
    this.fieldKey,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.maxLines,
    this.maxLength,
    this.obscureText,
    this.keyboardType,
    this.textInputAction,
    this.autocorrect = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final Key? fieldKey;
  final String name;
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final void Function()? onTap;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    // Observable for tracking obscureText state
    final RxBool isObscure = (obscureText ?? false).obs;

    return ObxValue(
      (RxBool state) => FormBuilderTextField(
        name: name,
        key: fieldKey,
        autofocus: false,
        obscureText: isObscure.value,
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
        autovalidateMode: autovalidateMode,
        validator: validator,
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        textInputAction: textInputAction,
        style: AppTextStyles.body,
        decoration: InputDecoration(
          suffixIcon: (obscureText ?? false)
              ? IconButton(
                  onPressed: () {
                    // Toggle obscureText state
                    isObscure.value = !isObscure.value;
                  },
                  splashColor: Colors.black,
                  icon: Icon(
                    isObscure.value ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            ),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(13),
            ),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          hintText: name,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontFamily: 'Gilroy',
          ),
        ),
        onTap: onTap,
        onChanged: (String? value) {
          if (validator != null) {
            state(validator?.call(value) == null);
          }

          if (onChanged != null) {
            onChanged?.call(value);
          }
        },
        onSubmitted: onSubmitted,
      ),
      (obscureText ?? false).obs,
    );
  }
}
