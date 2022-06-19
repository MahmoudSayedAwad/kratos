import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  late int water;
  late int steps;
  late int sleepingHours;
  late int meals;
  int getMeals() {
    int meals = _appPreferences.getNum("meals");
    if (meals == 0) {
      meals = Random().nextInt(5);
      _appPreferences.setNum("meals", meals);
    }
    return meals;
  }

  int getSteps() {
    int steps = _appPreferences.getNum("steps");
    if (steps == 0) {
      steps = Random().nextInt(6000);
      _appPreferences.setNum("steps", steps);
    }
    return steps;
  }

  int getSleepingHours() {
    int sleepingHours = _appPreferences.getNum("sleeping");

    return sleepingHours;
  }

  int getWater() {
    int water = _appPreferences.getNum("water");

    return water;
  }

  void setWater(int num) {
    _appPreferences.setNum("water", num);
  }

  @override
  void initState() {
    steps = getSteps();
    sleepingHours = getSleepingHours();
    water = getWater();
    meals = getMeals();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSize.s20, bottom: AppSize.s20),
          child: buildLogo(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            height: AppSize.s100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s28),
              border: Border.all(color: ColorManager.grey, width: 1),
              color: ColorManager.white,
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "STEPS",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: ColorManager.primary,
                              fontSize: FontSize.s20),
                    ),
                    Text(
                      "${steps.toString()}/6000",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: ColorManager.primary,
                              fontSize: FontSize.s20),
                    ),
                  ],
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    backgroundColor: ColorManager.grey,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorManager.primary),
                    value: steps / 6000,
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            height: AppSize.s100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s28),
              border: Border.all(color: ColorManager.grey, width: 1),
              color: ColorManager.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "FOOD",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s20),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "${meals.toString()}/5 Meals",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.mealsRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: FittedBox(
                      child: Text(
                        "RECORD",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: FontSize.s14,
                                color: ColorManager.white),
                      ),
                    )),
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: AppSize.s40,
                    decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s28)),
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            height: AppSize.s100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s28),
              border: Border.all(color: ColorManager.grey, width: 1),
              color: ColorManager.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "SLEEP",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s20),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          sleepingHours == 0
                              ? "How did you sleep?"
                              : "${sleepingHours.toString()} Hours",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.sleepRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                        child: FittedBox(
                      child: Text(
                        "RECORD",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: FontSize.s14,
                                color: ColorManager.white),
                      ),
                    )),
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: AppSize.s40,
                    decoration: BoxDecoration(
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s28)),
                  ),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            height: AppSize.s100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s28),
              border: Border.all(color: ColorManager.grey, width: 1),
              color: ColorManager.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WATER",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: ColorManager.primary,
                                fontSize: FontSize.s20),
                      ),
                      Text(
                        "${water.toString()}/glasses",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: ColorManager.primary,
                                fontSize: FontSize.s20),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          water++;
                          setWater(water);
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline),
                      color: ColorManager.grey,
                      iconSize: AppSize.s20,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (water > 0) {
                            water--;
                            setWater(water);
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                      ),
                      color: ColorManager.grey,
                      iconSize: AppSize.s20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
