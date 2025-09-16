import 'package:flutter/material.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/styles/app_styling.dart';
import '../../../core/widgets/custom_background_image.dart';

class CustomTopHomePartWidget extends StatelessWidget {
  const CustomTopHomePartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackgroundImage(
          backgroundImage: AppAssets.homeScreenImage,
          height: 270,
        ),
        Positioned(
          left: 80,
          top: 70,
          child: SizedBox(
            width: 200,
            height: 140,
            child: Text(
              'Welcome Add A New Recipe',
              style: AppStyles.onBoardingTitleStyle,
            ),
          ),
        ),
      ],
    );
  }
}
