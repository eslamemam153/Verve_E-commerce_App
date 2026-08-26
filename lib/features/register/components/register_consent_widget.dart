import 'package:flutter/material.dart';

class RegisterConsentWidget extends StatelessWidget {
  final bool keepInformed;
  final ValueChanged<bool?> onChanged;

  const RegisterConsentWidget({
    super.key,
    required this.keepInformed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: keepInformed,
            activeColor: colorScheme.primary,
            checkColor: colorScheme.onPrimary,
            side: BorderSide(color: colorScheme.outline),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Yes, keep me informed via email about the latest trends and special offers. (not mandatory)',
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
