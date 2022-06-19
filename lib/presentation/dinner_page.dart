import 'package:flutter/material.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class DinnerPage extends StatelessWidget {
  DinnerPage({Key? key}) : super(key: key);
  final List<Meal> dinner = [
    Meal(ImageAssets.dinner1, "Yogurt and fruit parfaits"),
    Meal(ImageAssets.dinner2, "Broccoli and cheese egg bake"),
    Meal(ImageAssets.dinner3, "Greek yogurt"),
    Meal(ImageAssets.dinner4, "Peanut Zucchini Noodle Salad with Chicken"),
    Meal(ImageAssets.dinner5, "Chicken, Brussels Sprouts & Mushroom Salad"),
    Meal(ImageAssets.dinner6, "Greek Summer Squash Grilled Pizza"),
    Meal(ImageAssets.dinner7, "Spring Green Frittata"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            height: 120,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: ColorManager.white,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Dinner\n Recommendations",
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    ImageAssets.whiteLogo,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.25,
                        right: MediaQuery.of(context).size.width * 0.25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Card(
                            elevation: AppSize.s8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(47.0),
                                side: const BorderSide(
                                    color: Color(0xff707070), width: 5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(47),
                              child: Image.asset(
                                dinner[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          dinner[index].mealName,
                          style: TextStyle(
                            fontSize: FontSize.s28,
                            color: ColorManager.darkGreyTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: AppSize.s20,
                  );
                },
                itemCount: dinner.length),
          ),
        ],
      ),
    );
  }
}

