import 'package:flutter/material.dart';
import 'package:kratos/presentation/main/pages/Calendar/calendar_page.dart';
import 'package:kratos/presentation/main/pages/home/view/home_page.dart';
import 'package:kratos/presentation/main/pages/premium/premium_page.dart';
import 'package:kratos/presentation/main/pages/profile/profile_page.dart';
import 'package:kratos/presentation/main/pages/workouts/workouts_page.dart';
import 'package:kratos/presentation/resources/color_manager.dart';
import 'package:kratos/presentation/resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var _currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const CalendarPage(),
     WorkoutsPage(),
    PremiumPage(),
     ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: buildMyNavBar(context),
      ),
    );
  }
  onTap(int index) {
    setState(() {
      _currentIndex = index;

    });
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: AppSize.s60,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s30),
          topRight: Radius.circular(AppSize.s30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            icon: _currentIndex == 0
                ?  Icon(
              Icons.home_filled,
              color: ColorManager.primary,
              size: 35,
            )
                :  Icon(
              Icons.home_outlined,
              color: ColorManager.grey,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            icon: _currentIndex == 1
                ?  Icon(
              Icons.work_rounded,
              color:ColorManager.primary,
              size: 35,
            )
                :  Icon(
              Icons.work_outline_outlined,
              color: ColorManager.grey,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            icon: _currentIndex == 2
                ?  Icon(
              Icons.widgets_rounded,
              color: ColorManager.primary,
              size: 35,
            )
                :  Icon(
              Icons.widgets_outlined,
              color: ColorManager.grey,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
            icon: _currentIndex == 3
                ?  Icon(
              Icons.star,
              color: ColorManager.primary,
              size: 35,
            )
                :  Icon(
              Icons.star_outline,
              color: ColorManager.grey,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                _currentIndex = 4;
              });
            },
            icon: _currentIndex == 4
                ?  Icon(
              Icons.person,
              color: ColorManager.primary,
              size: 35,
            )
                :  Icon(
              Icons.person_outline,
              color: ColorManager.grey,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
