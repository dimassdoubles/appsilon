library authentication;

import 'package:appsilon/src/common_widgets/space/medium_space.dart';
import 'package:appsilon/src/common_widgets/space/regular_space.dart';
import 'package:appsilon/src/common_widgets/styled_text_form_field.dart';
import 'package:appsilon/src/constants/app_constants.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: AppText.bold32,
                ),
                Text(
                  'Please sign in to continue',
                  style: AppText.medium20.copyWith(
                    color: AppColor.grey.withAlpha(200),
                  ),
                ),
                const MediumSpace(),
                StyledTextFormField(
                  labelText: 'Username',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppConstants.messageUsernameIsRequired;
                    }
                    return null;
                  },
                ),
                const RegularSpace(),
                StyledTextFormField(
                  labelText: 'Password',
                  validator: (val) {
                    if (val!.isEmpty) {
                      return AppConstants.messagePasswordIsRequired;
                    }
                    return null;
                  },
                  obscureText: _isObsecure,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                ),
                const MediumSpace(),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                    child: const Text(
                      'Sign In',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
