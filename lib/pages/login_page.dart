// // import 'package:flutter/material.dart';

// // String pressState = 'One Click';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       drawer: Drawer(),
// //       backgroundColor: Colors.cyan,
// //       body: GestureDetector(
// //         onDoubleTap: () {
// //           setState(() {
// //             pressState = "Two Click";
// //           });
// //         },
// //         onTap: () {
// //           setState(() {
// //             pressState = "Click";
// //           });
// //         },
// //         child: Center(
// //           child: Text(
// //             pressState,
// //             style: TextStyle(
// //               color: Colors.black,
// //               fontSize: 30,
// //               fontWeight: FontWeight(600),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   bool rememberMe = false;
// //   bool obscurePassword = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.symmetric(horizontal: 24),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const SizedBox(height: 25),

// //               // Top Row
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   const Text(
// //                     "Verve",
// //                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
// //                   ),
// //                   Row(
// //                     children: const [
// //                       Text(
// //                         "Select Country",
// //                         style: TextStyle(
// //                           color: Colors.deepPurple,
// //                           fontSize: 16,
// //                         ),
// //                       ),
// //                       SizedBox(width: 8),
// //                       Icon(Icons.language, size: 30),
// //                     ],
// //                   ),
// //                 ],
// //               ),

// //               const SizedBox(height: 50),

// //               const Text(
// //                 "Welcome back",
// //                 style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
// //               ),

// //               const SizedBox(height: 30),

// //               // Email
// //               TextField(
// //                 decoration: InputDecoration(
// //                   hintText: "Email",
// //                   hintStyle: const TextStyle(fontSize: 20),
// //                   contentPadding: const EdgeInsets.symmetric(
// //                     horizontal: 20,
// //                     vertical: 20,
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 20),

// //               // Password
// //               TextField(
// //                 obscureText: obscurePassword,
// //                 decoration: InputDecoration(
// //                   hintText: "Password",
// //                   hintStyle: const TextStyle(fontSize: 20),
// //                   contentPadding: const EdgeInsets.symmetric(
// //                     horizontal: 20,
// //                     vertical: 20,
// //                   ),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                   suffixIcon: IconButton(
// //                     icon: Icon(
// //                       obscurePassword
// //                           ? Icons.visibility_outlined
// //                           : Icons.visibility_off_outlined,
// //                     ),
// //                     onPressed: () {
// //                       setState(() {
// //                         obscurePassword = !obscurePassword;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 15),

// //               // Remember + Forgot Password
// //               Row(
// //                 children: [
// //                   Checkbox(
// //                     value: rememberMe,
// //                     onChanged: (value) {
// //                       setState(() {
// //                         rememberMe = value!;
// //                       });
// //                     },
// //                   ),
// //                   const Text("Remember me", style: TextStyle(fontSize: 16)),
// //                   const Spacer(),
// //                   TextButton(
// //                     onPressed: () {},
// //                     child: const Text(
// //                       "Forgot Password?",
// //                       style: TextStyle(color: Colors.deepPurple, fontSize: 16),
// //                     ),
// //                   ),
// //                 ],
// //               ),

// //               const SizedBox(height: 20),

// //               // Sign In Button
// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 60,
// //                 child: ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.black87,
// //                     foregroundColor: Colors.white,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(35),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     "Sign In",
// //                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 40),

// //               const Divider(),

// //               const SizedBox(height: 40),

// //               const Text(
// //                 "New to Verve",
// //                 style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
// //               ),

// //               const SizedBox(height: 25),

// //               // Register Button
// //               SizedBox(
// //                 width: double.infinity,
// //                 height: 60,
// //                 child: OutlinedButton(
// //                   onPressed: () {},
// //                   style: OutlinedButton.styleFrom(
// //                     side: const BorderSide(color: Colors.black),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(35),
// //                     ),
// //                   ),
// //                   child: const Text(
// //                     "Register",
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ),

// //               const SizedBox(height: 180),

// //               const Center(
// //                 child: Text(
// //                   "Terms of use & Privacy Policy",
// //                   style: TextStyle(color: Colors.deepPurple, fontSize: 16),
// //                 ),
// //               ),

// //               const SizedBox(height: 20),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: TextFormField(
//           decoration: InputDecoration(
//             hintText: "Email",
//             border: OutlineInputBorder(),
//           ),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Required";
//             }
//             if (!value.contains("@")) {
//               return "Enter a valid Email";
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_session_1/pages/home_page.dart';
// import 'package:flutter_session_1/pages/register_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool isChecked = false;
//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     log("نا هموووت سلاااااااااااااام", name: "Dispose_state");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Form(
//               key: formKey,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "Verve",
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "Select Country",
//                             style: TextStyle(fontSize: 12, color: Colors.blue),
//                           ),
//                           SizedBox(width: 20),
//                           Icon(Icons.language, size: 30),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Text(
//                         "Welcome Back",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       /********************************/
//                       //EMAIL_ADDRESS Text FIELD
//                       /********************************/
//                       TextFormField(
//                         controller: emailController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "This field can not be empty";
//                           }
//                           if (value.length < 3) {
//                             return "Invalid email. Please enter a valid email address";
//                           }
//                           return null;
//                         },
//                         textInputAction: TextInputAction.search,
//                         decoration: InputDecoration(
//                           labelText: "Email Address",
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.brown),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.lightGreen),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       /********************************/
//                       //PASSWORD Text FIELD
//                       /********************************/
//                       TextFormField(
//                         controller: passwordController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "This field can not be empty";
//                           }
//                           if (value.length < 8) {
//                             return "Please enter password more than 8 letters";
//                           }
//                           return null;
//                         },
//                         textInputAction: TextInputAction.search,
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.brown),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(color: Colors.lightGreen),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       /********************************/
//                       //REMEMBER_ME SECTION
//                       /********************************/
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox.adaptive(
//                                 value: isChecked,
//                                 onChanged: (value) {
//                                   if (isChecked == true) {
//                                     isChecked = false;
//                                   } else {
//                                     isChecked = true;
//                                   }
//                                   setState(() {
//                                     log(
//                                       "Data was changed...! please Rebuild it again",
//                                       name: "Set_state_of_checkbox",
//                                     );
//                                   });
//                                 },
//                               ),
//                               // SizedBox(width: 10),
//                               Text(
//                                 "Remember me",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             "Forget password?",
//                             style: TextStyle(fontSize: 12, color: Colors.blue),
//                           ),
//                         ],
//                       ),

//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           SizedBox(
//                             width: double.infinity,
//                             height: 50,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 if (formKey.currentState?.validate() ?? false) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       backgroundColor: Colors.green,
//                                       behavior: SnackBarBehavior.floating,
//                                       content: Text(
//                                         "logined successfully",
//                                         style: TextStyle(
//                                           fontSize: 30,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => HomePage(),
//                                     ),
//                                   );
//                                 }
//                               },

//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                               ),
//                               child: Text(
//                                 "Sign in",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 25),

//                       Divider(),
//                       SizedBox(height: 25),

//                       Text(
//                         "New to Verve",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 16),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           SizedBox(
//                             width: 350,
//                             height: 50,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, "/register");
//                                 // if (formKey.currentState?.validate() ?? false) {
//                                 //   ScaffoldMessenger.of(context).showSnackBar(
//                                 //     SnackBar(
//                                 //       backgroundColor: Colors.green,
//                                 //       behavior: SnackBarBehavior.floating,
//                                 //       content: Text(
//                                 //         "successfully login",
//                                 //         style: TextStyle(
//                                 //           fontSize: 15,
//                                 //           color: Colors.white,
//                                 //         ),
//                                 //       ),
//                                 //     ),
//                                 //   );

//                                 // }
//                               },

//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 side: BorderSide(color: Colors.black),
//                               ),
//                               child: Text(
//                                 "Register",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             spacing: 10,
//             children: [
//               Text(
//                 "Terms of use",
//                 style: TextStyle(fontSize: 16, color: Colors.blue),
//               ),
//               Text("&", style: TextStyle(fontSize: 16, color: Colors.black)),
//               Text(
//                 "Privacy Policy",
//                 style: TextStyle(fontSize: 16, color: Colors.blue),
//               ),
//             ],
//           ),
//           SizedBox(height: 15),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_1/pages/home_page.dart';
import 'package:flutter_session_1/pages/register_page.dart';

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
    super.dispose(); // <--- لازم تكون في الآخر
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ضفت SafeArea عشان الشاشة ماتدخلش في شريط الإشعارات فوق
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "Verve",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              "Select Country",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Icon(Icons.language, size: 30),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        /********************************/
                        // EMAIL_ADDRESS Text FIELD
                        /********************************/
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty";
                            }
                            if (value.length < 3) {
                              return "Invalid email. Please enter a valid email address";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction
                              .next, // خليتها next عشان تنزل للباسورد
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        /********************************/
                        // PASSWORD Text FIELD
                        /********************************/
                        TextFormField(
                          controller: passwordController,
                          obscureText: true, // ضفتها عشان الباسورد يكون مخفي
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field can not be empty";
                            }
                            if (value.length < 8) {
                              return "Please enter password more than 8 letters";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        /********************************/
                        // REMEMBER_ME SECTION
                        /********************************/
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
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Forget password?",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
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
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Divider(),
                        const SizedBox(height: 25),
                        const Text(
                          "New to Verve",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.black),
                                  ),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Terms of use",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                SizedBox(width: 10),
                Text("&", style: TextStyle(fontSize: 16, color: Colors.black)),
                SizedBox(width: 10),
                Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
