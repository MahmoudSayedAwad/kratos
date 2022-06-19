import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../app/app_prefrences.dart';
import '../../../../app/di.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String selectedMonth = DateFormat.MMMM().format(DateTime.now());
  DateTime targetDateTime = DateTime.now();
  late int water;
  late int steps;
  late int sleepingHours;
  late int meals;
  final AppPreferences _appPreferences=instance<AppPreferences>();
  int getMeals(){

    int meals=  _appPreferences.getNum("meals");

    return meals;
  }
  int getSteps(){

    int steps=  _appPreferences.getNum("steps");

    return steps;
  }
  int getSleepingHours(){

    int sleepingHours=  _appPreferences.getNum("sleeping");

    return sleepingHours;
  }
  int getWater() {
    int water=  _appPreferences.getNum("water");

    return water;

  }
  @override
  void initState() {
    steps= getSteps();
    sleepingHours=getSleepingHours();
    water=getWater();
    meals=getMeals();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:const EdgeInsets.only(left: 16) ,
              margin: const EdgeInsets.only(left: 16),
              height: 120,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Calendar",
                      style: TextStyle(
                          fontSize: 24,
                          color: ColorManager.black,
                          fontWeight: FontWeightManager.regular),
                    ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.splashLogo,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                selectedMonth,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: CalendarCarouselWidget(
                  currentDate: currentDate,
                  selectedDate: selectedDate,
                  selectedMonth: selectedMonth,
                  targetDateTime: targetDateTime,
                  onCalendarChange: (DateTime time) {
                    setState(() {
                      targetDateTime = time;
                      selectedMonth = DateFormat.MMMM().format(targetDateTime);
                    });
                  },
                  onDayPressed: (DateTime time,List<Event> events){
                    setState(() {
                      selectedDate=time;
                      water=Random().nextInt(10);
                      steps=Random().nextInt(6000);
                      sleepingHours=Random().nextInt(12);
                      meals=Random().nextInt(5);
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 40,
                crossAxisSpacing: 28,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: 150,
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
                    // child: ,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    height: 100,
                    width: 150,
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
                            sleepingHours==0?"How did you sleep?": "${sleepingHours.toString()} Hours",
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    height: 100,
                    width: 150,
                    child: Column(
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
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    height: 100,
                    width: 150,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalendarCarouselWidget extends StatelessWidget {
  const CalendarCarouselWidget(
      {Key? key,
      required this.currentDate,
      required this.selectedDate,
      required this.selectedMonth,
      required this.targetDateTime,
      required this.onCalendarChange,
      required this.onDayPressed})
      : super(key: key);
  final DateTime currentDate;
  final DateTime selectedDate;
  final String selectedMonth;
  final DateTime targetDateTime;
  final Function(DateTime) onCalendarChange;
  final Function(DateTime, List<Event>)? onDayPressed;

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      onDayPressed: onDayPressed,
      childAspectRatio: 1.5,
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      selectedDayButtonColor: Colors.purpleAccent,
      selectedDayBorderColor: Colors.purpleAccent,
      dayPadding: 1,
      showHeaderButton: false,
      selectedDayTextStyle: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      weekendTextStyle: const TextStyle(color: Colors.white),
      daysTextStyle: const TextStyle(color: Colors.white),
      inactiveDaysTextStyle: TextStyle(color: Colors.grey.shade300),
      weekdayTextStyle: const TextStyle(color: Colors.white),
      weekDayFormat: WeekdayFormat.short,
      firstDayOfWeek: 1,
      showHeader: false,
      selectedDateTime: selectedDate,
      // minSelectedDate: currentDate,
      maxSelectedDate: currentDate.add(const Duration(days: 360)),
      daysHaveCircularBorder: true,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      showOnlyCurrentMonthDate: true,
      inactiveWeekendTextStyle: TextStyle(color: Colors.grey.shade300),
      onCalendarChanged: (date) {
        onCalendarChange(date);
      },
    );
  }
}
