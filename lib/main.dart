import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'app/app.dart';
import 'app/di.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  await initAppModule();
      runApp(MyApp());
}



