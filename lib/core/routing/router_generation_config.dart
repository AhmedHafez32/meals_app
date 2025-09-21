import 'package:go_router/go_router.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/add_meal_screen/add_meal_screen.dart';

import '../../features/home_screen/home_screen.dart';
import '../../features/on_boarding_screen/on_boarding_screen.dart';
import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (_,_) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (_,_) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (_,_) {
          return const AddMealScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.addMealScreen,
        name: AppRoutes.addMealScreen,
        builder: (_,_) {
          return const WidthSpace(width: 2);
        },
      ),
      GoRoute(
        path: AppRoutes.changeListScreen,
        name: AppRoutes.changeListScreen,
        builder: (_,_) {
          return const WidthSpace(width: 2);
        },
      ),
    ],
  );
}
