import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/space/regular_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

@RoutePage()
class ConfirmationOrderScreen extends StatelessWidget {
  const ConfirmationOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Confirmation Order')),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order Detail'),
              const MiniSpace(),
              StyledContainer(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...ListTile.divideTiles(context: context, tiles: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppSize.paddingRegular),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Laundry Express'),
                                Text('2 Kg x 15.000')
                              ],
                            ),
                            const Text('30.000')
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Laundry Express'),
                              Text('2 Kg x 15.000')
                            ],
                          ),
                          const Text('30.000')
                        ],
                      )
                    ]).toList(),
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
                      children: [Text("Transaction Id"), Text("-")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Date"), Text('05 Juni 2023')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Parfume"),
                        Text("Onix"),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total"), Text("50.000")],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
