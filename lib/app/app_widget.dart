import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fullscreen/fullscreen.dart';

class AppWidget extends StatelessWidget {
  FullScreen fullscreen = new FullScreen();

  @override
  Widget build(BuildContext context) {
    fullscreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
