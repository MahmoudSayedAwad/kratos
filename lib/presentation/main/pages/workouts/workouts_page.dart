import 'package:flutter/material.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'package:kratos/presentation/widgets/shared_widget.dart';

class WorkoutsPage extends StatelessWidget {
   WorkoutsPage({Key? key}) : super(key: key);

 final List<String> workouts = [
    ImageAssets.workout1,
    ImageAssets.workout2,
    ImageAssets.workout3,
    ImageAssets.workout4,
    ImageAssets.workout5,
    ImageAssets.workout6,
    ImageAssets.workout7,
    ImageAssets.workout8,
    ImageAssets.workout9,
    ImageAssets.workout10,
    ImageAssets.workout11,
    ImageAssets.workout12,
    ImageAssets.workout13,
    ImageAssets.workout14,
    ImageAssets.workout15,
    ImageAssets.workout16,
    ImageAssets.workout17,
    ImageAssets.workout18,
    ImageAssets.workout19,
    ImageAssets.workout20,
    ImageAssets.workout21,
    ImageAssets.workout22,
    ImageAssets.workout23,
    ImageAssets.workout24,

  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppSize.s20,
            ),
            child: buildLogo(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "GUIDED Workouts",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: FontSize.s20, color: ColorManager.primary),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: AppSize.s28,
                crossAxisSpacing: AppSize.s8,
                children: workouts.map((w) {
                  return  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(w),fit: BoxFit.cover),
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s28)),
                  );
                }).toList()
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(ImageAssets.workout1),fit: BoxFit.cover),
                        color: ColorManager.grey,
                        borderRadius: BorderRadius.circular(AppSize.s28)),
                  ),*/