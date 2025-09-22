import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_styling.dart';
import '../../../core/widgets/spacing_widgets.dart';

class CustomTimeRateWidget extends StatelessWidget {
  final String mealRate;
  final String mealTime;
  const CustomTimeRateWidget({super.key, required this.mealRate, required this.mealTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 33,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
                const WidthSpace(width: 8),
                Text(mealTime, style: AppStyles.gray14Regular),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
                WidthSpace(width: 8),
                Text(
                 mealRate,
                  style: AppStyles.gray14Regular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
