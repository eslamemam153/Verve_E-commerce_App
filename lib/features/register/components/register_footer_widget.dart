import 'package:flutter/material.dart';

class RegisterFooterWidget extends StatelessWidget {
  const RegisterFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          color: colorScheme.onSurfaceVariant,
          fontSize: 12,
          height: 1.5,
        ),
        children: [
          const TextSpan(
            text: 'By registering for an account, you agree to our ',
          ),
          TextSpan(
            text: 'terms of use',
            style: TextStyle(color: colorScheme.primary),
          ),
          const TextSpan(text: '. Please read our '),
          TextSpan(
            text: 'privacy statement',
            style: TextStyle(color: colorScheme.primary),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
