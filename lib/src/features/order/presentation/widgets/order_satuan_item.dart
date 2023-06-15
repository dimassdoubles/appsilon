import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:appsilon/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderSatuanItem extends StatefulWidget {
  final Service service;
  const OrderSatuanItem({super.key, required this.service});

  @override
  State<OrderSatuanItem> createState() => _OrderSatuanItemState();
}

class _OrderSatuanItemState extends State<OrderSatuanItem> {
  int _qty = 0;

  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.paddingMini),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.service.serviceName,
              style: AppText.semiBold16.copyWith(color: AppColor.black)),
          const MiniSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${Utils.formatToIdr(widget.service.price)} / kg"),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius:
                            BorderRadius.circular(AppSize.borderRadiusRegular)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (_qty > 0) {
                                  _qty -= 1;
                                  _serviceOrderCubit.setService(
                                      widget.service, _qty);
                                }

                                if (_qty == 0) {
                                  _serviceOrderCubit.setService(
                                      widget.service, 0);
                                }
                              });
                            },
                            icon: SvgPicture.asset('assets/icons/minus.svg')),
                        const MiniSpace(orientation: Orientation.landscape),
                        Text('$_qty', style: AppText.semiBold16),
                        const MiniSpace(orientation: Orientation.landscape),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _qty += 1;
                                _serviceOrderCubit.setService(
                                    widget.service, _qty);
                              });
                            },
                            icon: SvgPicture.asset('assets/icons/plus.svg'))
                      ],
                    ),
                  ),
                  const RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                  const Text('Kg')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
