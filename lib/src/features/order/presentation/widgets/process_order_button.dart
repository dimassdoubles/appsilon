import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';

class ProccessOrderButton extends StatelessWidget {
  const ProccessOrderButton({
    super.key,
  });

  final double _buttonHeight = 82;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _buttonHeight + AppSize.paddingMedium * 2,
      child: SlideAction(
        trackHeight: _buttonHeight,
        trackBuilder: (context, currentState) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.borderRadiusMedium),
              color: AppColor.lightBlue,
            ),
            child: Center(
              child: Text(
                // Show loading if async operation is being performed
                currentState.isPerformingAction ? "Loading..." : "Proses Order",
                style: AppText.semiBold16.copyWith(color: Colors.white),
              ),
            ),
          );
        },
        thumbBuilder: (context, currentState) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(AppSize.borderRadiusRegular + 8),
            ),
            child: Center(
              // Show loading indicator if async operation is being performed
              child: currentState.isPerformingAction
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColor.lightBlue,
                        strokeWidth: 3,
                      ),
                    )
                  : const Icon(
                      Icons.chevron_right,
                      color: AppColor.lightBlue,
                    ),
            ),
          );
        },
        action: () async {
          // Async operation
          await Future.delayed(
            const Duration(seconds: 2),
            () => debugPrint("Hello World"),
          );
        },
      ),
    );
  }
}
