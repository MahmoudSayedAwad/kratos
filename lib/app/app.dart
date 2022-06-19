import 'package:flutter/material.dart';

import 'package:kratos/presentation/resources/routes_manager.dart';
import 'package:kratos/presentation/resources/theme_manager.dart';



class MyApp extends StatelessWidget {

  const MyApp._internal();
  final int appState = 0;
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
     /* home:
      MainView(),*/

    );
  }
}