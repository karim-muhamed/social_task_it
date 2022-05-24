// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/night_mode.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var checked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Theme"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [settingsWidget("Dark mode", Icons.dark_mode, context)],
        ),
      ),
    );
  }

  Widget settingsWidget(name, icon, context) {
    NightMode usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
    return ListTile(
        title: Text(name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: usertheme.getTheme() == ThemeData.dark()
                    ? Colors.black
                    : Colors.blue)),
        subtitle: Text("Turn dark mode on / off",
            style: TextStyle(
                color: usertheme.getTheme() == ThemeData.dark()
                    ? Colors.black
                    : Colors.blue)),
        leading: Icon(
          icon,
          color: usertheme.getTheme() == ThemeData.dark()
              ? Colors.black
              : Colors.blue,
        ),
        onTap: () {
          setState(() {
            checked = !checked;
            if (checked) {
              usertheme.UserthemeMode = ThemeData.dark();
            } else {
              usertheme.UserthemeMode = ThemeData.light();
            }
            usertheme.Enabled = checked;
          });
        },
        trailing: Checkbox(
          onChanged: (value) {
            setState(() {
              checked = value;

              if (checked) {
                usertheme.UserthemeMode = ThemeData.dark();
              } else {
                usertheme.UserthemeMode = ThemeData.light();
              }
              usertheme.Enabled = checked;
            });
          },
          value: checked,
        ));
  }
}
