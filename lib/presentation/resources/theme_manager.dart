import 'package:flutter/material.dart';
import 'package:kratos/presentation/resources/styles_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    timePickerTheme: TimePickerThemeData(

      backgroundColor: ColorManager.white,
      hourMinuteShape:  RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: ColorManager.primary, width: 4),
      ),
      dayPeriodBorderSide:  BorderSide(color: ColorManager.primary, width: 4),
      dayPeriodColor: ColorManager.grey,
      shape:  RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: ColorManager.primary, width: 4),
      ),
      dayPeriodTextColor: ColorManager.white,
      dayPeriodShape:  RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: ColorManager.primary, width: 4),
      ),
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? ColorManager.primary : ColorManager.grey),
      hourMinuteTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? Colors.white : Colors.orange),
      dialHandColor: ColorManager.primary,
      dialBackgroundColor: ColorManager.grey,
      hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),

      ),
      dialTextColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? ColorManager.primary : Colors.white),
      entryModeIconColor: ColorManager.primary,



    ),
    primaryColor: ColorManager.primary,
    splashColor: ColorManager.backgroundColor,
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      buttonColor: ColorManager.primary,
     // disabledColor: ColorManager.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: getExtraBoldStyle(
          color: ColorManager.darkGreyTextColor, fontSize: FontSize.s28),
      headlineLarge: getBoldStyle(
          color: ColorManager.darkGreyTextColor, fontSize: FontSize.s26),
      headlineMedium: getSemiBoldStyle(
          color: ColorManager.darkGreyTextColor, fontSize: FontSize.s22),
      labelLarge:
          getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s18),
      titleLarge: getSemiBoldStyle(
          color: ColorManager.darkGreyTextColor, fontSize: FontSize.s18),
      labelSmall: getRegularStyle(
          color: ColorManager.darkGreyTextColor, fontSize: FontSize.s14),
    ),

  );
}
