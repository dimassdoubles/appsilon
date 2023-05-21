import 'package:appsilon/src/shared/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required String image,
    required String label,
  })  : _image = image,
        _label = label;

  final String _image, _label;

  @override
  Widget build(BuildContext context) {
    return StyledContainer(
      child: Column(
        children: [
          Image.asset(
            _image,
            width: 150,
          ),
          Text(
            _label,
            style: AppText.semiBold16,
          )
        ],
      ),
    );
  }
}
