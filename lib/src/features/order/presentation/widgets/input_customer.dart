import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class InputCustomer extends StatefulWidget {
  const InputCustomer({
    super.key,
  });

  @override
  State<InputCustomer> createState() => _InputCustomerState();
}

class _InputCustomerState extends State<InputCustomer> {
  Customer? _customer;

  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const SelectCustomerRoute());
      },
      child: BlocListener<ServiceOrderCubit, ServiceOrder?>(
        bloc: _serviceOrderCubit,
        listener: (context, state) {
          setState(() {
            _customer = state!.customer;
          });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSize.paddingRegular + 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadiusMedium),
            color: _customer != null
                ? AppColor.lightBlue
                : AppColor.grey.withAlpha(100),
            border: Border.all(
                color: _customer != null ? Colors.transparent : AppColor.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _customer != null ? _customer!.customerName : 'Pilih Pelanggan',
                style: AppText.semiBold16.copyWith(
                    color: _customer != null ? Colors.white : AppColor.grey),
              ),
              _customer != null
                  ? IconButton(
                      onPressed: () {
                        _serviceOrderCubit.setCustomer(null);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/delete.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/delete.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.transparent, BlendMode.srcIn),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
