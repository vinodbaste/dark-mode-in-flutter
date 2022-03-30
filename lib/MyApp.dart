import 'package:dark_theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DarkThemeNotifier.dart';
import 'MyHomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Here we are asynchronously passing an instance of SharedPreferences
    /// to our Settings ChangeNotifier class and that in turn helps us
    /// determine the basic app settings to be applied whenever the app is
    /// launched.
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        return ChangeNotifierProvider<DarkThemeNotifier>.value(
          value: DarkThemeNotifier(snapshot.data),
          child: _MyApp(),
        );
      },
    );
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dark Theme Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, //follow system
      darkTheme: setDarkTheme,
      theme: Provider.of<DarkThemeNotifier>(context).isDarkMode
          ? setDarkTheme
          : setLightTheme,
      home: MyHomePage(title: 'Home Page'),
    );
  }
}