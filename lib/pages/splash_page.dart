import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white12],
              stops: [0.4, 1.0],
            ).createShader(bounds);
          },
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                'Verve',
                textStyle: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
