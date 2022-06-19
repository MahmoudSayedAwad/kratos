import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kratos/app/app_prefrences.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/resources/font_manager.dart';
import 'package:kratos/presentation/resources/strings_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

import '../resources/app_constants.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Widget _content = Center(
    child: Hero(
      tag: AppStrings.imageHero,
      child: SvgPicture.asset(ImageAssets.splashLogo),
    ),
  );
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _changeContent() {
    setState(() {
      _content = Container(
        constraints: const BoxConstraints(
          minWidth: AppSize.s300,
          maxWidth: AppSize.s300,
          minHeight: AppSize.s126,
          maxHeight: AppSize.s200,
        ),
        child: Text(
          AppStrings.splashSentence,
          maxLines: AppConstants.maxLines,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: FontSize.s35, color: ColorManager.white),
          textAlign: TextAlign.center,
        ),
      );
    });
  }

  _goNext() async {
    _changeContent();
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), () {
      _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
            if (isUserLoggedIn)
              {Navigator.pushReplacementNamed(context, Routes.mainRoute)}
            else
              {Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)}
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImageAssets.backgroundImg,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          _content
        ],
      ),
    );
  }
}
