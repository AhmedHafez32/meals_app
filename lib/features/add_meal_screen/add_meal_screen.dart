import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_routes.dart';
import 'package:meals_app/core/styles/app_colors.dart';
import 'package:meals_app/core/styles/app_styling.dart';
import 'package:meals_app/core/widgets/custom_text_field.dart';
import 'package:meals_app/core/widgets/primary_button_widget.dart';
import 'package:meals_app/core/widgets/spacing_widgets.dart';
import 'package:meals_app/features/home_screen/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home_screen/data/model/food_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;
  final DBHelper dbHelper = DBHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Meal', style: AppStyles.black16MediumStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child:
              isLoading
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                  : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeightSpace(height: 25),
                        Text('Meal Name', style: AppStyles.black16MediumStyle),
                        HeightSpace(height: 8),
                        CustomTextField(
                          controller: mealNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Add Meal Name';
                            } else if (val.length < 3) {
                              return "{Please add more than 3 character";
                            }
                            return null;
                          },
                        ),
                        HeightSpace(height: 12),
                        Text('Image URL', style: AppStyles.black16MediumStyle),
                        HeightSpace(height: 8),
                        CustomTextField(
                          controller: imageURLController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Add Image URL';
                            } else if (val.length < 3) {
                              return "{Please add more than 3 character";
                            }
                            return null;
                          },
                        ),
                        HeightSpace(height: 12),
                        Text('Rate', style: AppStyles.black16MediumStyle),
                        HeightSpace(height: 8),
                        CustomTextField(
                          controller: rateController,
                          inputKeyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Add Rate';
                            }
                            return null;
                          },
                        ),
                        HeightSpace(height: 12),
                        Text('Time', style: AppStyles.black16MediumStyle),
                        HeightSpace(height: 8),
                        CustomTextField(
                          controller: timeController,
                          inputKeyboardType: TextInputType.number,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Add Time';
                            }
                            return null;
                          },
                        ),
                        HeightSpace(height: 12),
                        Text(
                          'Description',
                          style: AppStyles.black16MediumStyle,
                        ),
                        HeightSpace(height: 8),
                        CustomTextField(
                          controller: descriptionController,
                          maxLines: 5,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Add Description';
                            }
                            return null;
                          },
                        ),
                        HeightSpace(height: 70),
                        PrimaryButtonWidget(
                          buttonText: 'Add Meal',
                          borderRadius: 100,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              FoodModel meal = FoodModel(
                                image: imageURLController.text,
                                foodName: mealNameController.text,
                                rate: double.parse(rateController.text),
                                description: descriptionController.text,
                                time: timeController.text,
                              );

                              dbHelper.insertMeal(meal).then((value) {
                                GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
                              });
                              //dbHelper.insertMeal(FoodModel(image: image, foodName: foodName, rate: rate, description: description, time: time))
                            }
                          },
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}
