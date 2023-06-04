library authentication;

import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_text_form_field.dart';
import 'package:appsilon/src/constants/app_constants.dart';
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart'
    as my;
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isObsecure = true;

  late final TextEditingController _usernameCtrl;
  late final TextEditingController _passCtrl;

  late final my.AuthBloc _authBloc;

  @override
  void initState() {
    _usernameCtrl = TextEditingController();
    _passCtrl = TextEditingController();

    _authBloc = getIt.get<my.AuthBloc>();

    super.initState();
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<my.AuthBloc, my.AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state is my.AuthLoading) {
            EasyLoading.show();
          } else if (state is my.AuthFail) {
            EasyLoading.showError(state.failure.message);
          } else if (state is my.AuthSuccess) {
            EasyLoading.dismiss();
            context.router.replace(const HomeRoute());
          }
        },
        child: Form(
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
                    controller: _usernameCtrl,
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
                    controller: _passCtrl,
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
                      icon: _isObsecure
                          ? SvgPicture.asset('assets/icons/eye.svg')
                          : SvgPicture.asset('assets/icons/eye-off.svg'),
                    ),
                  ),
                  const MediumSpace(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final username = _usernameCtrl.text;
                          final password = _passCtrl.text;

                          log("username: $username");
                          log("password: $password");

                          _authBloc.add(my.EvSignIn(
                              username: username, password: password));
                        }
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
      ),
    );
  }
}
