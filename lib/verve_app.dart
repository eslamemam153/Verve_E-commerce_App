import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/about/about_page.dart';
import 'package:flutter_session_1/features/home/home_page.dart';
import 'package:flutter_session_1/features/login/login_page.dart';
import 'package:flutter_session_1/features/navigation_bar/main_navigation_page.dart';
import 'package:flutter_session_1/features/not_found/not_found_page.dart';
import 'package:flutter_session_1/features/profile/profile_page.dart';
import 'package:flutter_session_1/features/register/register_page.dart';
import 'package:flutter_session_1/features/settings/settings_page.dart';
import 'package:flutter_session_1/splash/splash_page.dart';


void main(List<String> args) {
  runApp(VerveApp());
}

class VerveApp extends StatelessWidget {
  const VerveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "/": (context) => MainNavigationBar(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/profile": (context) => ProfilePage(),
        "/settings": (context) => SettingsPage(),
        "/home": (context) => HomePage(),
        "/about": (context) => AboutPage(),
        "splash": (context) => SplashPage(),
      },

      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => NotFoundPage()),

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.system,
    );
  }
}


