import 'package:flutter/material.dart';
import 'package:meals_app/core/assets/app_assets.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals_app/features/home_screen/widgets/custom_top_home_part_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {},
        backgroundColor: AppColors.whiteColor,
        child: Icon(Icons.add, size: 30, color: AppColors.primaryColor),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopHomePartWidget(),
            const HeightSpace(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text('Your Food', style: AppStyles.black16MediumStyle),
            ),
            const HeightSpace(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return CustomFoodItemWidget(
                      image: AppAssets.item1image,
                      foodName: 'Cheese Burger',
                      rate: 4.9,
                      time: '20 - 30',
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
