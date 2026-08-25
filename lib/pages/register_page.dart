import 'package:flutter/material.dart';
import 'package:flutter_session_1/components/register_custom_text_field.dart';
import 'package:flutter_session_1/pages/home_page.dart';

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

  // Validation_Function //
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header_Section //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Verve',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Egypt',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.language, color: Colors.grey.shade800),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Status_Text //
              const Text(
                'I’m new here',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Text_Fieldes //
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
                suffixIcon: const Icon(Icons.calendar_today_outlined),
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

              // Checkbox_Section //
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: keepInformed,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          keepInformed = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Yes, keep me informed via email about the latest trends and special offers. (not mandatory)',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Sign_In_Button //
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Footer_Section //
              RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'By registering for an account, you agree to our ',
                    ),
                    TextSpan(
                      text: 'terms of use',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    TextSpan(text: '. Please read our '),
                    TextSpan(
                      text: 'privacy statement',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
