import 'dart:developer';

import 'package:appsilon/src/features/order/presentation/widgets/service_card.dart';
import 'package:appsilon/src/features/order/presentation/widgets/transaction_card.dart';
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
import 'package:flutter_svg/svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppSilon'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
            child: StyledContainer(
              color: AppColor.lightBlue,
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppSize.borderRadiusRegular)),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/scan.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColor.grey, BlendMode.srcIn),
                      )),
                ),
                const RegularSpace(
                  orientation: Orientation.landscape,
                ),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.paddingRegular),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                AppSize.borderRadiusRegular)),
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Cari transaksi",
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    'assets/icons/search.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColor.grey, BlendMode.srcIn),
                                  ))),
                        )))
              ]),
            ),
          ),
          const RegularSpace(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.paddingRegular),
                    child: Text(
                      'Layanan',
                      style: AppText.semiBold16.copyWith(color: AppColor.grey),
                    ),
                  ),
                  const MiniSpace(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSize.paddingMedium),
                      child: Row(
                        children: [
                          const RegularSpace(
                            orientation: Orientation.landscape,
                          ),
                          ServiceCard(
                            onTap: () {
                              log("cuci setrika di klik");
                              context.router.push(const CreateOrderRoute());
                            },
                            image: 'assets/icons/washing-machine.png',
                            label: 'Cuci Setrika',
                          ),
                          const RegularSpace(
                            orientation: Orientation.landscape,
                          ),
                          ServiceCard(
                            onTap: () {},
                            image: 'assets/icons/iron.png',
                            label: 'Setrika',
                          ),
                          const RegularSpace(
                            orientation: Orientation.landscape,
                          ),
                          ServiceCard(
                            onTap: () {},
                            image: 'assets/icons/subscription-service.png',
                            label: 'Langganan',
                          ),
                          const RegularSpace(
                            orientation: Orientation.landscape,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.paddingRegular),
                    child: Text(
                      'Transaksi Hari Ini',
                      style: AppText.semiBold16.copyWith(color: AppColor.grey),
                    ),
                  ),
                  const MiniSpace(),
                  const TransactionCard(
                    transactionId: 'TRX051223001',
                    customer: 'Anjani',
                    service: 'Cuci Setrika Kiloan',
                    price: '30.000',
                    isPaid: true,
                  ),
                  const MiniSpace(),
                  const TransactionCard(
                    transactionId: 'TRX051223002',
                    customer: 'Areka',
                    service: 'Strika',
                    price: '10.000',
                  ),
                  const MiniSpace(),
                  const TransactionCard(
                    transactionId: 'TRX051223003',
                    customer: 'Dimas',
                    service: 'Langganan',
                    price: '120.000',
                  ),
                  const MiniSpace(),
                  const TransactionCard(
                    transactionId: 'TRX051223004',
                    customer: 'Serana',
                    service: 'Cuci Setrika Satuan',
                    price: '24.000',
                    isPaid: true,
                  ),
                  const EndSpace()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
