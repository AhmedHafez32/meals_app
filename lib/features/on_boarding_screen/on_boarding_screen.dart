import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/custom_background_image.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/on_boarding_screen/on_boarding_services/on_boarding_serives.dart';

import '../../core/assets/app_assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<String> titles = [
    'Save Your Meals Ingredient',
    'Use Our App The Best Choice',
    'Our AppYour Ultimate Choice',
  ];

  final List<String> descriptions = [
    'Add Your Meals and its Ingredients and we will save it for you',
    'the best choice for your kitchen do not hesitate',
    'All the best restaurants and their top menus are ready for you',
  ];
  int currentIndexPage = 0;

  CarouselSliderController cont = CarouselSliderController();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      bool isFirstTime = OnBoardingServices.isFirstTime();
      OnBoardingServices.setFirstTimeWithFalse();
      if(isFirstTime==false){
        GoRouter.of(context).pushReplacementNamed(AppRoutes.homeScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomBackgroundImage(backgroundImage: AppAssets.onBoardingImage),
            Positioned(
              bottom: 16,
              right: 32,
              left: 32,
              child: Container(
                width: 311,
                height: 450,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      carouselController: cont,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                        height: 250,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        padEnds: true,
                      ),
                      items: List.generate(titles.length, (index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: 252,
                              child: Column(
                                children: [
                                  Text(
                                    titles[index],
                                    textAlign: TextAlign.center,
                                    style: AppStyles.onBoardingTitleStyle,
                                  ),
                                  HeightSpace(height: 20),
                                  Text(
                                    descriptions[index],
                                    textAlign: TextAlign.center,
                                    style: AppStyles.onBoardingDescriptionStyle,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                    DotsIndicator(
                      dotsCount: titles.length,
                      position: currentIndexPage as double,
                      onTap: (index) {
                        cont.animateToPage(index);
                        currentIndexPage = index;
                        setState(() {});
                      },
                      decorator: DotsDecorator(
                        color: Color(0xffC2C2C2),
                        activeColor: AppColors.whiteColor,
                        size: const Size(24, 6),
                        activeSize: const Size(24, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    // HeightSpace(height: 60),
                    Spacer(),
                    currentIndexPage >= 2
                        ? InkWell(
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.homeScreen);
                          },
                          child: Container(
                            width: 62,
                            height: 62,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 17,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                GoRouter.of(
                                  context,
                                ).pushNamed(AppRoutes.homeScreen);
                              },
                              child: Text(
                                'skip',
                                style: AppStyles.white14SemiBoldStyle,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (currentIndexPage < 2) {
                                  currentIndexPage++;
                                  cont.animateToPage(currentIndexPage);
                                  setState(() {});
                                }
                              },
                              child: Text(
                                'next',
                                style: AppStyles.white14SemiBoldStyle,
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
