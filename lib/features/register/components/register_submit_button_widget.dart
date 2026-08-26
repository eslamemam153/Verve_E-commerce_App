import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/navigation_bar/main_navigation_page.dart';

class RegisterSubmitButtonWidget extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback onPressed;

  const RegisterSubmitButtonWidget({
    super.key,
    required this.isFormValid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isFormValid
            ? () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainNavigationBar()),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          disabledBackgroundColor: colorScheme.surfaceContainerHighest,
          foregroundColor: colorScheme.onPrimary,
          disabledForegroundColor: colorScheme.onSurfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
