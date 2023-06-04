import 'package:appsilon/src/themes/app_size.dart';
import 'package:flutter/material.dart';

class EndSpace extends StatelessWidget {
  final Orientation orientation;
  const EndSpace({super.key, this.orientation = Orientation.portrait});

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case Orientation.portrait:
        return const SizedBox(
          height: AppSize.paddingLarge * 3,
        );
      case Orientation.landscape:
        return const SizedBox(
          width: AppSize.paddingLarge * 3,
        );
    }
  }
}
