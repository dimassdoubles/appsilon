import 'package:appsilon/src/themes/app_size.dart';
import 'package:flutter/material.dart';

class MiniSpace extends StatelessWidget {
  final Orientation orientation;
  const MiniSpace({super.key, this.orientation = Orientation.portrait});

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case Orientation.portrait:
        return const SizedBox(
          height: AppSize.paddingMini,
        );
      case Orientation.landscape:
        return const SizedBox(
          width: AppSize.paddingMini,
        );
    }
  }
}
