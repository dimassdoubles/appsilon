library authentication;

import 'package:appsilon/src/localizations/string_harcoded.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!'.hardcoded,
        ),
      ),
    );
  }
}
