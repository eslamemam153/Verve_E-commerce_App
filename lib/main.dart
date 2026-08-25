//       // theme: ThemeData(
//       //   colorScheme: ColorScheme.fromSeed(
//       //     brightness: Brightness.light,
//       //     seedColor: Colors.blueGrey,
//       //   ),
//       // ),
//       // darkTheme: ThemeData(
//       //   colorScheme: ColorScheme.fromSeed(
//       //     brightness: Brightness.dark,
//       //     seedColor: Colors.blueGrey,
//       //   ),
//       // ),
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_session_1/pages/home_page.dart';
import 'package:flutter_session_1/pages/login_page.dart';
import 'package:flutter_session_1/pages/main_navigation_page.dart';
import 'package:flutter_session_1/pages/profile_page.dart';
import 'package:flutter_session_1/pages/register_page.dart';
import 'package:flutter_session_1/pages/settings_page.dart';
import 'package:flutter_session_1/pages/splash_page.dart';
import 'package:flutter_session_1/pages/test_page.dart';

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
        "splash": (context) => SplashPage(),
      },

      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => NOtFound404()),
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class NOtFound404 extends StatelessWidget {
  const NOtFound404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sorry 404", style: TextStyle(fontSize: 40))),
    );
  }
}

// class ProdcutPage extends StatelessWidget {
//   const ProdcutPage({super.key, required this.id});
//   final int id;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("$id", style: TextStyle(fontSize: 40))),
//     );
//   }
// }
