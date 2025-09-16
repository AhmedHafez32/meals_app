import 'package:go_router/go_router.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';

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
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.mealDetailsScreen,
        name: AppRoutes.mealDetailsScreen,
        builder: (context, state) {
          return const WidthSpace(width: 2);
        },
      ),
      GoRoute(
        path: AppRoutes.addMealScreen,
        name: AppRoutes.addMealScreen,
        builder: (context, state) {
          return const WidthSpace(width: 2);
        },
      ),
      GoRoute(
        path: AppRoutes.changeListScreen,
        name: AppRoutes.changeListScreen,
        builder: (context, state) {
          return const WidthSpace(width: 2);
        },
      ),
    ],
  );
}
