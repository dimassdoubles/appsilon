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
              Text('Payments'),
              MiniSpace(),
              Row(
                children: [
                  StyledContainer(
                    child: Text('Cash'),
                  ),
                  const RegularSpace(
                    orientation: Orientation.landscape,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.router.push(const PaymentRoute());
                    },
                    child: StyledContainer(
                      child: Text('Cashless'),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
