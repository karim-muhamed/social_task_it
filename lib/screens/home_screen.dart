// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/addPost_screen.dart';
import 'package:flutter_app/screens/settings_screen.dart';
import 'package:flutter_app/screens/viewPosts_screen.dart';
import 'package:provider/provider.dart';
import '../provider/night_mode.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var checked;
  @override
  Widget build(BuildContext context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: usertheme.getTheme() == ThemeData.dark()
                        ? Colors.black
                        : Colors.blue),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPostScreen())),
                child: const Text("Add Post")),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: usertheme.getTheme() == ThemeData.dark()
                        ? Colors.black
                        : Colors.blue),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewPostsScreen())),
                child: const Text("View Posts")),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: usertheme.getTheme() == ThemeData.dark()
                        ? Colors.black
                        : Colors.blue),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen())),
                child: const Text("Settings")),
          ],
        ),
      ),
    );
  }
}
