import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer({
    super.key,
    Widget? child,
    double? width,
    double? height,
  })  : _child = child,
        _width = width,
        _height = height;

  final double? _width, _height;
  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      padding: const EdgeInsets.all(AppSize.paddingRegular),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AppSize.borderRadiusRegular,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 26,
              offset: const Offset(0, 10),
              color: AppColor.lightBlue.withOpacity(0.15),
            )
          ]),
      child: _child,
    );
  }
}
