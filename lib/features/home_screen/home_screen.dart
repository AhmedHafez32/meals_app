import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/model/food_model.dart';
import 'package:meals_app/features/home_screen/widgets/custom_food_item_widget.dart';
import 'package:meals_app/features/home_screen/widgets/custom_top_home_part_widget.dart';
import 'data/db_helper/db_helper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DBHelper dbHelper = DBHelper.instance;

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
        onPressed: () {
          GoRouter.of(context).pushNamed(AppRoutes.addMealScreen);
        },
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

            FutureBuilder(
              future: dbHelper.getMeals(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      "No data found",
                      style: AppStyles.black16MediumStyle,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 22,
                          mainAxisSpacing: 22,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          FoodModel meal = snapshot.data![index];
                          return CustomFoodItemWidget(
                            image: meal.image,
                            foodName: meal.foodName,
                            rate: meal.rate,
                            time: meal.time,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
