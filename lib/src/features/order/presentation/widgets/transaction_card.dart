import 'package:appsilon/src/shared/presentation/widgets/space/mini_space.dart';
import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
      required String transactionId,
      required String customer,
      required String service,
      required String price,
      bool isPaid = false})
      : _transactionId = transactionId,
        _customer = customer,
        _service = service,
        _price = price,
        _isPaid = isPaid;

  final String _transactionId, _customer, _service, _price;
  final bool _isPaid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingRegular),
      child: StyledContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _transactionId,
                  style: const TextStyle(color: AppColor.grey),
                ),
                const MiniSpace(),
                Text(
                  _customer,
                  style: AppText.medium16,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _service,
                  style: const TextStyle(color: AppColor.grey),
                ),
                const MiniSpace(),
                Text(
                  'Rp $_price',
                  style: AppText.medium16.copyWith(
                    color: _isPaid ? AppColor.green : AppColor.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
