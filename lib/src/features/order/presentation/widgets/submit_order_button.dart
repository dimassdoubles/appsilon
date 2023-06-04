import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SubmitOrderButton extends StatelessWidget {
  const SubmitOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingMedium),
      child: Container(
        padding: const EdgeInsets.all(AppSize.paddingRegular),
        decoration: BoxDecoration(
            color: AppColor.lightBlue,
            borderRadius: BorderRadius.circular(AppSize.borderRadiusMedium)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Total: Rp 500.000',
            style: AppText.semiBold16.copyWith(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(const ConfirmationOrderRoute());
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.paddingRegular,
                  horizontal: AppSize.borderRadiusMedium),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSize.borderRadiusRegular)),
              backgroundColor: Colors.white,
              foregroundColor: AppColor.black,
              textStyle: AppText.medium16,
            ),
            child: const Text('Submit'),
          )
        ]),
      ),
    );
  }
}
