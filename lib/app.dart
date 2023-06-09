import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: _appRouter.config(),
      builder: EasyLoading.init(),
    );
  }
}
