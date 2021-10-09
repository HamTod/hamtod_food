import 'package:flutter/material.dart';
import 'package:hamtod_food/pages/food/food_detail.dart';
import 'package:hamtod_food/pages/food/food_list_page.dart';
import 'package:hamtod_food/pages/home/home.dart';
import 'package:hamtod_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
            headline6: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,

            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          )),
      //home: LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/detail':(context) => const Detail(),
      },
      initialRoute: '/login',
    );
  }
}