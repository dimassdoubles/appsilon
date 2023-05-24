import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_bloc.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_event.dart';
import 'package:appsilon/src/features/order/presentation/blocs/service_state.dart';
import 'package:appsilon/src/features/order/presentation/widgets/drop_down_parfume.dart';
import 'package:appsilon/src/shared/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/widgets/space/regular_space.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

@RoutePage()
class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _serviceBloc = getIt.get<ServiceBloc>();

  @override
  void initState() {
    _serviceBloc.add(EvGetServiceList('743d4e2d-7608-40d4-b712-193cbbc08fbd'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Order'),
      ),
      body: BlocConsumer(
        listener: (context, state) {
          if (state is ServiceLoading) {
            EasyLoading.show();
          } else if (state is ServiceFail) {
            EasyLoading.showError(state.failure.message);
          } else {
            EasyLoading.dismiss();
          }
        },
        bloc: _serviceBloc,
        builder: (context, state) {
          if (state is SuccessGetServiceList) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSize.paddingMedium),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pelanggan',
                      style: AppText.semiBold16.copyWith(color: AppColor.grey),
                    ),
                    const RegularSpace(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSize.paddingRegular + 4),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadiusRegular),
                        color: AppColor.grey.withAlpha(100),
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Tambah Pelanggan',
                          style:
                              AppText.semiBold16.copyWith(color: AppColor.grey),
                        ),
                      ),
                    ),
                    const MediumSpace(),
                    Text(
                      'Parfum',
                      style: AppText.semiBold16.copyWith(color: AppColor.grey),
                    ),
                    const RegularSpace(),
                    const DropDownParfume(),
                  ]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
