import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  const StyledContainer(
      {super.key,
      Widget? child,
      double? width,
      double? height,
      Color? color,
      bool border = false})
      : _child = child,
        _width = width,
        _height = height,
        _color = color,
        _border = border;

  final Color? _color;
  final double? _width, _height;
  final Widget? _child;
  final bool _border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      padding: const EdgeInsets.all(AppSize.paddingRegular),
      decoration: BoxDecoration(
          color: _color ?? Colors.white,
          borderRadius: BorderRadius.circular(
            AppSize.borderRadiusRegular,
          ),
          border:
              _border ? Border.all(color: AppColor.lightBlue, width: 2) : null,
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
