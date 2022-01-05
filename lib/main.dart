import 'package:flutter/material.dart';
import 'package:newz/Pages/GeneralNews.dart';
import 'package:newz/Pages/home.dart';
import 'package:newz/Utils/Colors.dart';
import 'package:newz/Pages/techNews.dart';
import 'package:newz/Pages/GeneralNews.dart';
import 'package:newz/Pages/buisnessNews.dart';
import 'package:newz/Pages/HealthNews.dart';
import 'package:newz/Pages/scienceNews.dart';
import 'package:newz/Pages/SportsNews.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        TechNews.id: (context) => TechNews(),
        GeneralNews.id: (context) => GeneralNews(),
        BusinessNews.id: (context) => BusinessNews(),
        SportsNews.id: (context) => SportsNews(),
        ScienceNews.id: (context) => ScienceNews(),
        HealthNews.id: (context) => HealthNews(),
      },
    );
  }
}
