import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/service.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/end_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:appsilon/src/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ConfirmationOrderScreen extends StatefulWidget {
  const ConfirmationOrderScreen({super.key});

  @override
  State<ConfirmationOrderScreen> createState() =>
      _ConfirmationOrderScreenState();
}

class _ConfirmationOrderScreenState extends State<ConfirmationOrderScreen> {
  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  late final List<Widget> _orderItems;

  late int _total;

  PaymentMethod? _paymentMethod;

  @override
  void initState() {
    super.initState();

    _serviceOrderCubit.setPaymentMethod(null);
    _serviceOrderCubit.setPaymentAmount(0);

    final services = _serviceOrderCubit.state!.services;
    final keys = services.keys;

    _orderItems = keys
        .map((e) => DetailOrderItem(service: e, qty: services[e]!))
        .toList();

    _total = 0;

    for (var key in keys) {
      _total += services[key]! * key.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Confirmation Order')),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Pesanan',
                  style: AppText.semiBold16.copyWith(color: AppColor.grey),
                ),
                const MiniSpace(),
                if (_orderItems.isNotEmpty)
                  StyledContainer(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...ListTile.divideTiles(
                                context: context, tiles: _orderItems)
                            .toList(),
                      ],
                    ),
                  ),
                const RegularSpace(),
                StyledContainer(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("Transaction Id"), Text("-")],
                      ),
                      const MiniSpace(
                        orientation: Orientation.portrait,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text("Date"), Text('05 Juni 2023')],
                      ),
                      const MiniSpace(
                        orientation: Orientation.portrait,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Parfume"),
                          Text(_serviceOrderCubit.state!.parfume != null
                              ? _serviceOrderCubit.state!.parfume!.parfumeName
                              : "-"),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total"),
                          Text(
                            Utils.formatToIdr(_total),
                            style: AppText.bold16,
                          )
                        ],
                      ),
                      const Divider(),
                      const MiniSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Pembayaran"),
                          Text(
                              Utils.formatToIdr(
                                  _serviceOrderCubit.state!.paymentAmount),
                              style: AppText.semiBold12.copyWith(
                                color: AppColor.grey,
                              ))
                        ],
                      ),
                      const MiniSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Kembalian"),
                          Text(
                            Utils.formatToIdr(
                                _serviceOrderCubit.state!.returnAmount),
                            style:
                                AppText.bold16.copyWith(color: AppColor.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const MediumSpace(),
                Text(
                  'Metode Pembayaran',
                  style: AppText.semiBold16.copyWith(color: AppColor.grey),
                ),
                const MiniSpace(),
                BlocListener<ServiceOrderCubit, ServiceOrder?>(
                  bloc: _serviceOrderCubit,
                  listener: (context, state) => setState(() {
                    _paymentMethod = state!.paymentMethod;
                  }),
                  child: Wrap(
                    spacing: AppSize.paddingRegular,
                    runSpacing: AppSize.paddingRegular,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _serviceOrderCubit.setPaymentMethod(null);
                          _serviceOrderCubit.setPaymentAmount(0);
                        },
                        child: StyledContainer(
                          border: _paymentMethod == null ? true : false,
                          width: 150,
                          height: 150,
                          child: Center(
                              child: Text(
                            "Bayar Nanti",
                            style: AppText.semiBold16.copyWith(
                                color: _paymentMethod == null
                                    ? AppColor.lightBlue
                                    : Colors.black),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(const PaymentRoute());
                        },
                        child: StyledContainer(
                          border: _paymentMethod == PaymentMethod.tunai
                              ? true
                              : false,
                          width: 150,
                          height: 150,
                          child: Center(
                              child: Text(
                            "Tunai",
                            style: AppText.semiBold16.copyWith(
                                color: _paymentMethod == PaymentMethod.tunai
                                    ? AppColor.lightBlue
                                    : Colors.black),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: StyledContainer(
                          border: _paymentMethod == PaymentMethod.nonTunai,
                          width: 150,
                          height: 150,
                          child: Center(
                              child: Text(
                            "Non Tunai",
                            style: AppText.semiBold16.copyWith(
                                color: _paymentMethod == PaymentMethod.nonTunai
                                    ? AppColor.lightBlue
                                    : Colors.black),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                const EndSpace()
              ],
            ),
          ),
        ));
  }
}

class DetailOrderItem extends StatelessWidget {
  final Service _service;
  final int _qty;
  const DetailOrderItem({
    super.key,
    required Service service,
    required int qty,
  })  : _service = service,
        _qty = qty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.paddingMini),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_service.serviceName, style: AppText.bold16),
              Text('$_qty Kg x ${Utils.formatToIdr(_service.price)}')
            ],
          ),
          Text(Utils.formatToIdr(_service.price * _qty))
        ],
      ),
    );
  }
}
