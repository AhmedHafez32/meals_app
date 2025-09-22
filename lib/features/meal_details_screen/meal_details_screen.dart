import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/model/food_model.dart';
import 'package:meals_app/features/meal_details_screen/widget/custom_time_rate_widget.dart';

class MealDetailsScreen extends StatelessWidget {
  final FoodModel meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: meal.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 327,
                    ),
                  ),
                  Positioned(
                    left: 11.5,
                    top: 17,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.whiteColor),
                      ),
                      child: IconButton(
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).pushReplacement(AppRoutes.homeScreen);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpace(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.foodName,
                    style: AppStyles.gray14Regular.copyWith(
                      fontSize: 24,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const HeightSpace(height: 21),
                  CustomTimeRateWidget(
                    mealRate: meal.rate.toString(),
                    mealTime: meal.time,
                  ),
                  const HeightSpace(height: 27),
                  Divider(color: Color(0xffEDEDED), thickness: 2),
                  const HeightSpace(height: 24),
                  Text(
                    "Description",
                    style: AppStyles.black16MediumStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const HeightSpace(height: 8),
                  Text(meal.description, style: AppStyles.gray14Regular),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
