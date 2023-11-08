import 'package:flutter/material.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/my_theme.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}

