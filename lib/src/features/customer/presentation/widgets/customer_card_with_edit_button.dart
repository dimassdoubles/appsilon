import 'package:appsilon/src/features/customer/domain/models/customer.dart';
import 'package:appsilon/src/shared/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomerCardWithEditButton extends StatelessWidget {
  const CustomerCardWithEditButton({super.key, required Customer customer})
      : _customer = customer;

  final Customer _customer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.paddingMini),
      child: StyledContainer(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _customer.customerName,
                  style: AppText.medium16,
                ),
                const MiniSpace(),
                Text(
                  _customer.phone,
                  style: const TextStyle(color: AppColor.grey),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/edit.svg'))
          ],
        ),
      ),
    );
  }
}
