import 'package:flutter/material.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Terms of use",
          style: TextStyle(fontSize: 16, color: colorScheme.primary),
        ),
        const SizedBox(width: 10),
        Text("&", style: TextStyle(fontSize: 16, color: colorScheme.onSurface)),
        const SizedBox(width: 10),
        Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 16, color: colorScheme.primary),
        ),
      ],
    );
  }
}
