import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StyledTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;

  const StyledTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(
        AppSize.borderRadiusRegular,
      ),
    );

    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
          errorBorder: underlineInputBorder,
          focusedErrorBorder: underlineInputBorder,
          border: underlineInputBorder,
          filled: true,
          fillColor: AppColor.grey.withAlpha(50),
          labelText: labelText,
          suffixIcon: suffixIcon,
          floatingLabelAlignment: FloatingLabelAlignment.start),
      key: key,
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
