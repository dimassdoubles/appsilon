import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/authentication/presentation/blocs/auth_bloc.dart';
import 'package:appsilon/src/localizations/string_harcoded.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/end_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final AuthBloc _authBloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
        ),
        actions: [
          BlocListener<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: (context, state) {
              if (state is AuthLoading) {
                EasyLoading.show();
              } else if (state is AuthFail) {
                EasyLoading.showError(state.failure.message);
              } else if (state is AuthSuccess) {
                EasyLoading.dismiss();
                context.router.replaceAll([const SignInRoute()]);
              }
            },
            child: IconButton(
              onPressed: () {
                log("sign out");
                _authBloc.add(EvSignOut());
              },
              icon: SvgPicture.asset('assets/icons/sign-out.svg'),
            ),
          ),
          const RegularSpace(
            orientation: Orientation.landscape,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Layanan',
                style: AppText.semiBold16.copyWith(color: AppColor.grey),
              ),
              const MiniSpace(),
              StyledContainer(
                child: Column(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        title: Text('Cuci setrika kiloan'.hardcoded),
                      ),
                      ListTile(
                        title: Text('Cuci setrika satuan'.hardcoded),
                      ),
                      ListTile(
                        title: Text('Setrika'.hardcoded),
                      ),
                      // ListTile(
                      //   title: Text('Langganan'.hardcoded),
                      // ),
                    ],
                  ).toList(),
                ),
              ),
              const RegularSpace(),
              // Text(
              //   'Staff',
              //   style: AppText.semiBold16.copyWith(color: AppColor.grey),
              // ),
              // const MiniSpace(),
              // StyledContainer(
              //   child: Column(
              //     children: ListTile.divideTiles(
              //       context: context,
              //       tiles: [
              //         ListTile(
              //           title: Text('Kelola staff'.hardcoded),
              //         ),
              //       ],
              //     ).toList(),
              //   ),
              // ),
              // const RegularSpace(),
              Text(
                'Pelanggan',
                style: AppText.semiBold16.copyWith(color: AppColor.grey),
              ),
              const MiniSpace(),
              StyledContainer(
                child: Column(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        title: Text('Kelola Pelanggan'.hardcoded),
                        onTap: () =>
                            context.router.push(const CustomerListRoute()),
                      ),
                      // ListTile(
                      //   title: Text('Tambah Pelanggan Baru'.hardcoded),
                      //   onTap: () =>
                      //       context.router.push(const AddCustomerRoute()),
                      // ),
                    ],
                  ).toList(),
                ),
              ),
              const EndSpace()
            ],
          ),
        ),
      ),
    );
  }
}
