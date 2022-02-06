import 'package:flutter/material.dart';
import 'package:newz/Pages/home.dart';
import 'package:newz/Utils/Colors.dart';
import 'package:newz/Pages/techNews.dart';
import 'package:provider/provider.dart';
import 'package:newz/Backend/Value.dart';

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
    return ChangeNotifierProvider(
      create: (context) => Value(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: AppColors.primary),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          TechNews.id: (context) => TechNews(),
        },
      ),
    );
  }
}
