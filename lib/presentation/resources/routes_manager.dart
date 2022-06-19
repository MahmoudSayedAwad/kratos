import 'package:flutter/material.dart';
import 'package:kratos/app/di.dart';
import 'package:kratos/presentation/BreackFast/break_fast.dart';
import 'package:kratos/presentation/Sleeping/sleeping_time.dart';
import 'package:kratos/presentation/bmi/bmi_page.dart';
import 'package:kratos/presentation/dinner_page.dart';
import 'package:kratos/presentation/login/login_view.dart';
import 'package:kratos/presentation/lunch_page.dart';
import 'package:kratos/presentation/main/main_view.dart';
import 'package:kratos/presentation/meals%20recommendation/meals_recommendation.dart';
import 'package:kratos/presentation/register/medication_screen.dart';
import 'package:kratos/presentation/onBoarding/on_boarding_view.dart';
import 'package:kratos/presentation/register/register_view.dart';
import 'package:kratos/presentation/resources/strings_manager.dart';
import 'package:kratos/presentation/snacks_page.dart';
import 'package:kratos/presentation/splash/splash_view.dart';

class Routes {
  static const String mainRoute = "/main";
  static const String medicationRoute = "/medication";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String splashRoute = "/";
  static const String bmiRoute = "/bmi";
  static const String sleepRoute="/sleep";
  static const String mealsRoute="/meals";
  static const String breakfastRoute="/breakfast";
  static const String dinnerRoute="/dinner";
  static const String lunchRoute="/lunch";
  static const String snacksRoute="/snacks";


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView(),settings: settings);
      case Routes.sleepRoute:
        return MaterialPageRoute(builder: (_) =>  SleepingTime());
      case Routes.mealsRoute:
        return MaterialPageRoute(builder: (_) => const MealsRecommendation());
      case Routes.snacksRoute:
        return MaterialPageRoute(builder: (_) =>  SnacksPage());
      case Routes.breakfastRoute:
        return MaterialPageRoute(builder: (_) =>  BreakfastPage());
      case Routes.lunchRoute:
        return MaterialPageRoute(builder: (_) =>  LunchPage());
      case Routes.dinnerRoute:
        return MaterialPageRoute(builder: (_) =>  DinnerPage());

      case Routes.medicationRoute:
        initRegisterModule();
        return MaterialPageRoute(
            builder: (_) => MedicationScreen(), settings: settings);
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());

      case Routes.splashRoute:

        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.bmiRoute:
        return MaterialPageRoute(builder: (_) => const BmiPage(),settings: settings);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings
                    .noRouteFound), // todo move this string to strings manager
              ),
              body: const Center(
                  child: Text(AppStrings
                      .noRouteFound)), // todo move this string to strings manager
            ));
  }
}
