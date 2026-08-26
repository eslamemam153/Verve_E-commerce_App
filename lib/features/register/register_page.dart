import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/home_page.dart';
import 'package:flutter_session_1/features/register/components/register_consent_widget.dart';
import 'package:flutter_session_1/features/register/components/register_custom_text_field.dart';
import 'package:flutter_session_1/features/register/components/register_footer_widget.dart';
import 'package:flutter_session_1/features/register/components/register_header_widget.dart';
import 'package:flutter_session_1/features/register/components/register_submit_button_widget.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String dob = '';
  String password = '';
  bool keepInformed = false;
  bool isPasswordObscured = true;
  bool isFormValid = false;

  void _validateForm() {
    bool isValid =
        firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        email.contains('@') &&
        dob.trim().isNotEmpty &&
        password.trim().length >= 6;

    if (isFormValid != isValid) {
      setState(() {
        isFormValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RegisterHeaderWidget(),
              const SizedBox(height: 24),
              CustomTextField(
                label: 'First Name',
                onChanged: (value) {
                  firstName = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Last Name',
                onChanged: (value) {
                  lastName = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email address',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Date of Birth',
                hintText: 'DD/MM/YYYY',
                suffixIcon: Icon(
                  Icons.calendar_today_outlined,
                  color: colorScheme.onSurfaceVariant,
                ),
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  dob = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Password (6-12 characters)',
                obscureText: isPasswordObscured,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordObscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordObscured = !isPasswordObscured;
                    });
                  },
                ),
                onChanged: (value) {
                  password = value;
                  _validateForm();
                },
              ),
              const SizedBox(height: 32),
              RegisterConsentWidget(
                keepInformed: keepInformed,
                onChanged: (value) {
                  setState(() {
                    keepInformed = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 32),
              RegisterSubmitButtonWidget(
                isFormValid: isFormValid,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              const SizedBox(height: 40),
              const RegisterFooterWidget(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
