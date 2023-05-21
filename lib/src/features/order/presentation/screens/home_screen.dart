import 'package:appsilon/src/features/order/presentation/widgets/service_card.dart';
import 'package:appsilon/src/features/order/presentation/widgets/transaction_card.dart';
import 'package:appsilon/src/shared/widgets/space/end_space.dart';
import 'package:appsilon/src/shared/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.paddingRegular,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '2',
                          style:
                              AppText.semiBold20.copyWith(color: Colors.white),
                        ),
                        const Text(
                          'Masuk',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '10',
                          style:
                              AppText.semiBold20.copyWith(color: Colors.white),
                        ),
                        const Text(
                          'Harus Selesai',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '3',
                          style:
                              AppText.semiBold20.copyWith(color: Colors.white),
                        ),
                        const Text(
                          'Telat',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const RegularSpace(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
            child: Text(
              'Service',
              style: AppText.semiBold16.copyWith(color: AppColor.grey),
            ),
          ),
          const MiniSpace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSize.paddingMedium),
              child: Row(
                children: const [
                  RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                  ServiceCard(
                    image: 'assets/icons/washing-machine.png',
                    label: 'Cuci Setrika',
                  ),
                  RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                  ServiceCard(
                    image: 'assets/icons/iron.png',
                    label: 'Setrika',
                  ),
                  RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                  ServiceCard(
                    image: 'assets/icons/subscription-service.png',
                    label: 'Langganan',
                  ),
                  RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
            child: Text(
              'Transaction Today',
              style: AppText.semiBold16.copyWith(color: AppColor.grey),
            ),
          ),
          const MiniSpace(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  TransactionCard(
                    transactionId: 'TRX051223001',
                    customer: 'Anjani',
                    service: 'Cuci Setrika Kiloan',
                    price: '30.000',
                    isPaid: true,
                  ),
                  MiniSpace(),
                  TransactionCard(
                    transactionId: 'TRX051223002',
                    customer: 'Areka',
                    service: 'Strika',
                    price: '10.000',
                  ),
                  MiniSpace(),
                  TransactionCard(
                    transactionId: 'TRX051223003',
                    customer: 'Dimas',
                    service: 'Langganan',
                    price: '120.000',
                  ),
                  MiniSpace(),
                  TransactionCard(
                    transactionId: 'TRX051223004',
                    customer: 'Serana',
                    service: 'Cuci Setrika Satuan',
                    price: '24.000',
                    isPaid: true,
                  ),
                  EndSpace()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
