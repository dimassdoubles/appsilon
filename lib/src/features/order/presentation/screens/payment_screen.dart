import 'dart:developer';

import 'package:appsilon/injection.dart';
import 'package:appsilon/src/features/order/domain/models/service_order.dart';
import 'package:appsilon/src/features/order/presentation/cubits/service_order_cubit.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/medium_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:appsilon/src/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> buttons = [
    '7',
    '8',
    '9',
    'DEL',
    '4',
    '5',
    '6',
    'C',
    '1',
    '2',
    '3',
    'PAS',
    '0',
    '00',
    '000',
    '✓',
  ];

  final _serviceOrderCubit = getIt.get<ServiceOrderCubit>();

  late int _total;

  late int _paymentAmount;

  final _paymentAmountCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    final services = _serviceOrderCubit.state!.services;
    final keys = services.keys;

    _total = 0;

    for (var key in keys) {
      _total += services[key]! * key.price;
    }

    _paymentAmount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pembayaran')),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Belanja',
                          style: TextStyle(color: AppColor.grey),
                        ),
                        Text(Utils.formatToIdr(_total)),
                      ],
                    ),
                    const MediumSpace(),
                    TextFormField(
                      controller: _paymentAmountCtrl,
                      readOnly: true,
                      style: AppText.bold20,
                      decoration: const InputDecoration(
                        hintText: "Jumlah Pembayaran",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                    const MiniSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kembalian',
                          style: TextStyle(color: AppColor.grey),
                        ),
                        Text(_paymentAmount > _total
                            ? Utils.formatToIdr(_paymentAmount - _total)
                            : "-"),
                      ],
                    ),
                  ],
                ),
              ),
              const MediumSpace(),
              Expanded(
                  child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: AppSize.paddingMini,
                    mainAxisSpacing: AppSize.paddingMini),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  switch (index) {
                    // angka 7
                    case 0:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}7");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 8
                    case 1:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}8");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 9
                    case 2:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}9");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka DEL
                    case 3:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            if (_paymentAmount > 0) {
                              final answer = _paymentAmount
                                  .toString()
                                  .substring(
                                      0, _paymentAmount.toString().length - 1);

                              _paymentAmount = int.parse(answer);
                              _paymentAmountCtrl.text =
                                  Utils.formatToIdr(_paymentAmount);
                            }
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 4
                    case 4:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}4");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 5
                    case 5:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}5");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 6
                    case 6:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}6");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka C
                    case 7:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = 0;
                            _paymentAmountCtrl.text = "";
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 1
                    case 8:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}1");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 2
                    case 9:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}2");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 3
                    case 10:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}3");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka PAS
                    case 11:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            setState(() {
                              _paymentAmount = _total;
                              _paymentAmountCtrl.text =
                                  Utils.formatToIdr(_paymentAmount);
                            });
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 0
                    case 12:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}0");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 00
                    case 13:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}00");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // angka 000
                    case 14:
                      return CalculatorButton(
                        onTap: () {
                          setState(() {
                            _paymentAmount = int.parse("${_paymentAmount}000");
                            _paymentAmountCtrl.text =
                                Utils.formatToIdr(_paymentAmount);
                          });
                        },
                        label: buttons[index],
                      );

                    // submit
                    case 15:
                      return CalculatorButton(
                        onTap: () {
                          if (_paymentAmount >= _total) {
                            log("sampai sini");
                            _serviceOrderCubit
                                .setPaymentMethod(PaymentMethod.tunai);
                            _serviceOrderCubit.setPaymentAmount(_paymentAmount);

                            context.router.pop();
                          }
                        },
                        label: buttons[index],
                        color: _paymentAmount >= _total
                            ? AppColor.lightBlue
                            : AppColor.grey,
                      );
                  }
                },
              ))
            ],
          ),
        ));
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color,
  });

  final String label;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: StyledContainer(
        color: color ?? Colors.white,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
