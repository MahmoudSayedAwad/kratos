import 'package:flutter/material.dart';
import 'package:kratos/presentation/resources/assets_manager.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: Center(child: Image.asset(ImageAssets.whiteLogo)),
            decoration:  BoxDecoration(
              color: ColorManager.primary,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80))
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              },
              child: const SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(child: Text("SIGN IN")),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.registerRoute);
              },
              child: const SizedBox(
                width: double.infinity,
                height: 40,
                child: Center(child: Text("SIGN UP")),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
