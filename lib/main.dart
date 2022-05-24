// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_app/provider/night_mode.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<NightMode>.value(value: NightMode())
    ], child: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: usertheme.getTheme(),
      home: Scaffold(body: HomeScreen()),
    );
  }
}
