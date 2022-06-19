import 'package:flutter/material.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User arguments = ModalRoute.of(context)?.settings.arguments as User;
    double height = arguments.height / 100;
    double bmi = (arguments.weight / (height * height));
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(child: Image.asset(ImageAssets.whiteLogo)),
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(80))),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s16),
                child: Text(
                  "Your BMI :",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeightManager.medium,
                      color: ColorManager.darkGreyTextColor,
                      fontSize: FontSize.s20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppSize.s4),
                child: Text(
                  bmi.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeightManager.bold,
                      color: ColorManager.darkGreyTextColor,
                      fontSize: FontSize.s18),
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                  height: AppSize.s60,
                  width: AppSize.s100,
                  decoration: BoxDecoration(
                    color: bmi > 25 ? ColorManager.primary : ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s28),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "OVER WEIGHT",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: FontSize.s18,
                              color: bmi > 25
                                  ? ColorManager.white
                                  : ColorManager.darkGreyTextColor),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                  height: AppSize.s60,
                  width: AppSize.s100,
                  decoration: BoxDecoration(
                    color: (bmi >= 18 && bmi <= 25)
                        ? ColorManager.primary
                        : ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s28),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "NORMAL",
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: FontSize.s18,
                                color: (bmi >= 18 && bmi <= 25)
                                    ? ColorManager.white
                                    : ColorManager.darkGreyTextColor,
                              ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                  height: AppSize.s60,
                  width: AppSize.s100,
                  decoration: BoxDecoration(
                    color:
                        (bmi < 18) ? ColorManager.primary : ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s28),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "UNDER WEIGHT",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: FontSize.s18,
                              color: (bmi < 18)
                                  ? ColorManager.white
                                  : ColorManager.darkGreyTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
            child: Text(
              "Our Recomendations",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: AppSize.s16, fontWeight: FontWeightManager.medium),
            ),
          ),
          const SizedBox(
            height: AppSize.s16,
          ),
          Expanded(
            child: Image.asset(ImageAssets.bmiContainer,
            width: double.infinity,
            fit: BoxFit.fill,),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.mainRoute,arguments: arguments);
              },
              child: const SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(child: Text("Continue")),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
        ],
      ),
    );
  }
}
