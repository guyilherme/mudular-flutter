import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teha/app/app_module.dart';
import 'package:teha/app/navigator_service.dart';

class AppWidget extends StatelessWidget {
  final navigatorKey = AppModule.to.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TehA',
      navigatorKey: navigatorKey.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            color: Colors.green,
          ),
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
