import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:appsilon/src/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitOrderButton extends StatefulWidget {
  const SubmitOrderButton({
    super.key,
  });

  @override
  State<SubmitOrderButton> createState() => _SubmitOrderButtonState();
}

class _SubmitOrderButtonState extends State<SubmitOrderButton> {
  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingMedium),
      child: Container(
        padding: const EdgeInsets.all(AppSize.paddingRegular),
        decoration: BoxDecoration(
            color: AppColor.lightBlue,
            borderRadius: BorderRadius.circular(AppSize.borderRadiusMedium)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          BlocBuilder<ServiceOrderCubit, ServiceOrder?>(
              bloc: _serviceOrderCubit,
              builder: (context, state) {
                final servicesKey = state!.services.keys;
                int total = 0;

                for (var key in servicesKey) {
                  total += state.services[key]! * key.price;
                }

                return Text(
                  'Total: ${Utils.formatToIdr(total)}',
                  style: AppText.semiBold16.copyWith(color: Colors.white),
                );
              }),
          ElevatedButton(
            onPressed: () {
              if (_serviceOrderCubit.state!.services.keys.isNotEmpty) {
                context.router.push(const ConfirmationOrderRoute());
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.paddingRegular,
                  horizontal: AppSize.borderRadiusMedium),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSize.borderRadiusRegular)),
              backgroundColor: Colors.white,
              foregroundColor: AppColor.black,
              textStyle: AppText.medium16,
            ),
            child: const Text('Submit'),
          )
        ]),
      ),
    );
  }
}
