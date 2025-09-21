import 'package:flutter/material.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomFoodItemWidget extends StatelessWidget {
  const CustomFoodItemWidget({
    super.key,
    required this.image,
    required this.foodName,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  final String image;
  final String foodName;
  final double rate;
  final String time;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      //highlightColor: Colors.transparent,
      child: Container(
        //width: 153,
        //height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                height: 106,
                width: 137,
                fit: BoxFit.fitWidth,
                imageUrl: image,
                errorWidget:
                    (_, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
              ),
            ),
            HeightSpace(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                foodName,
                style: AppStyles.black16MediumStyle,
                maxLines: 1,
              ),
            ),
            HeightSpace(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primaryColor, size: 16),
                    const WidthSpace(width: 4),
                    Text(
                      rate.toString(),
                      style: AppStyles.gray14Regular.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later,
                      color: AppColors.primaryColor,
                      size: 16,
                    ),
                    const WidthSpace(width: 4),
                    Text(
                      time,
                      style: AppStyles.gray14Regular.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
