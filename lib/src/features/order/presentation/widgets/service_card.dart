import 'package:appsilon/src/shared/presentation/widgets/styled_container.dart';
import 'package:appsilon/src/themes/app_text.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
   const ServiceCard({
    super.key,
    required String image,
    required String label,
    required void Function() onTap,
  })  : _image = image,
        _label = label, _onTap = onTap;

  final String _image, _label;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: StyledContainer(
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
      ),
    );
  }
}
