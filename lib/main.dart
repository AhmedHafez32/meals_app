import 'package:flutter/material.dart';
import 'package:meals_app/core/routing/router_generation_config.dart';
import 'package:meals_app/features/on_boarding_screen/on_boarding_services/on_boarding_serives.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OnBoardingServices.initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: RouterGenerationConfig.goRouter,
    );
  }
}
