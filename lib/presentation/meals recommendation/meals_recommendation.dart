import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import '../resources/assets_manager.dart';

class MealsRecommendation extends StatelessWidget {
  const MealsRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16),
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 22,
                        ),
                      ),
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Meals\n Recommendations",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      ImageAssets.splashLogo,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, Routes.breakfastRoute);
              },
                child: buildCard("Break Fast")),
            const SizedBox(
              height: AppSize.s30,
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.lunchRoute);
                },
                child: buildCard(" Lunch")),
            const SizedBox(
              height: AppSize.s30,
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.dinnerRoute);
                },
                child: buildCard(" Dinner")),
            const SizedBox(
              height: AppSize.s30,
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.snacksRoute);
                },
                child: buildCard(" Snacks")),
            const SizedBox(
              height: AppSize.s30,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCard(String first) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s28),
          child: Container(
            padding: const EdgeInsets.fromLTRB(AppSize.s16, AppSize.s8, AppSize.s16, AppSize.s8),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s28),
              border: Border.all(width: AppSize.s1, color: ColorManager.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  first,
                  style: const TextStyle(

                    fontSize: 23,
                    color: Color(0xffd68a13),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                ),
                const Text(
                  'See Yours',
                  style: TextStyle(

                    fontSize: 15,
                    color: Color(0xffd68a13),
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: false,
                )
              ],
            ),
          ),
        );
  }
}
