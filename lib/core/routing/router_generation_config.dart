import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';
import 'package:meals_app/features/home_screen/data/model/food_model.dart';
import 'package:meals_app/features/meal_details_screen/meal_details_screen.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/on_boarding_screen/on_boarding_screen.dart';
import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    errorBuilder: (_, _) {
      return Scaffold(
        body: Center(
          child: Text(
            'This Route is not found',
            style: AppStyles.black16MediumStyle,
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (_, _) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (_, _) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (_, state) {
          FoodModel meal = state.extra as FoodModel;
          return MealDetailsScreen(meal: meal);
        },
      ),
      GoRoute(
        path: AppRoutes.addMealScreen,
        name: AppRoutes.addMealScreen,
        builder: (_, _) {
          return const AddMealScreen();
        },
      ),
    ],
  );
}
