import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SelectCustomerCard extends StatelessWidget {
  const SelectCustomerCard({super.key, required Customer customer})
      : _customer = customer;

  final Customer _customer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: AppSize.paddingMini,
          right: AppSize.paddingRegular,
          left: AppSize.paddingRegular),
      child: GestureDetector(
        onTap: () {
          final serviceOrderCubit = getIt.get<ServiceOrderCubit>();
          serviceOrderCubit.setCustomer(_customer);
          context.router.pop();
        },
        child: StyledContainer(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _customer.customerName,
                  style: AppText.medium16,
                ),
                Text(
                  _customer.phone,
                  style: const TextStyle(color: AppColor.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
