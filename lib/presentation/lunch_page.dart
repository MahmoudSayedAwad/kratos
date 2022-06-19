import 'package:flutter/material.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class LunchPage extends StatelessWidget {
  LunchPage({Key? key}) : super(key: key);
  final List<Meal> lunch = [
    Meal(ImageAssets.lunch1, "Grilled chicken meat and fresh vegetable salad"),
    Meal(ImageAssets.lunch2, "Grilled Chicken"),
    Meal(ImageAssets.lunch3, "Fried chicken fillet and a fresh vegetable salad"),
    Meal(ImageAssets.lunch4, "brown rice, cucumber, tomato, green peas, red cabbage"),
    Meal(ImageAssets.lunch5, "Brussels Sprouts Salad with Crunchy Chickpeas"),
    Meal(ImageAssets.lunch6, "Sweet potato black bean meal prep bowls"),
    Meal(ImageAssets.lunch7, "Vegan Spinach And Sun-Dried Tomato Pasta"),
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
                    "Launch\n Recommendations",
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
                                lunch[index].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          lunch[index].mealName,
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
                itemCount: lunch.length),
          ),
        ],
      ),
    );
  }
}

