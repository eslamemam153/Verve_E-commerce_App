import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/login/components/login_custom_text_field_widget.dart';
import 'package:flutter_session_1/features/login/components/login_footer_widget.dart';
import 'package:flutter_session_1/features/login/components/login_header_widget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    log("نا هموووت سلاااااااااااااام", name: "Dispose_state");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LoginHeaderWidget(),
                        const SizedBox(height: 15),
                        CustomTextFieldWidget(
                          controller: emailController,
                          labelText: "Email Address",
                      
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty";
                            }
                            if (value.length < 3) {
                              return "Invalid email. Please enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFieldWidget(
                          controller: passwordController,
                          labelText: "Password",
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty";
                            }
                            if (value.length < 8) {
                              return "Please enter password more than 8 letters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox.adaptive(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value ?? false;
                                      log(
                                        "Data was changed...! please Rebuild it again",
                                        name: "Set_state_of_checkbox",
                                      );
                                    });
                                  },
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Forget password?",
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        "/",
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.primary,
                                    foregroundColor: colorScheme.onPrimary,
                                  ),
                                  child: const Text("Sign in"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Divider(color: colorScheme.outlineVariant),
                        const SizedBox(height: 25),
                        Text(
                          "New to Verve",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/register");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.surface,
                                    foregroundColor: colorScheme.primary,
                                    side: BorderSide(
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  child: const Text("Register"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const LoginFooterWidget(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
