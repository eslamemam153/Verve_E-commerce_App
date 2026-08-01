import 'package:flutter/material.dart';
import 'package:flutter_session_1/login_Screen.dart';
import 'package:flutter_session_1/splash_screen.dart';
import 'package:flutter_session_1/test_Screen.dart';

// void main() {
//   runApp(MyWidget());
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: LoginScreen());
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Text(
//           "Eslam",
//           style: TextStyle(
//             color: const Color.fromARGB(255, 133, 224, 5),
//             fontSize: 70,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Text(
//           "Login Screen",
//           style: TextStyle(
//             color: const Color.fromARGB(255, 39, 226, 207),
//             fontSize: 50,
//             fontWeight: FontWeight(400),
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestScreen(),

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     brightness: Brightness.light,
      //     seedColor: Colors.blueGrey,
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     brightness: Brightness.dark,
      //     seedColor: Colors.blueGrey,
      //   ),
      // ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
