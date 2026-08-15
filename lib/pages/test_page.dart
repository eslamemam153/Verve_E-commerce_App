// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// // body: Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: Container(
// //     width: 200,
// //     height: 200,
// //     alignment: Alignment.centerRight,
// //     decoration: BoxDecoration(
// //       color: Colors.teal,
// //       borderRadius: BorderRadius.circular(50),
// //       border: Border.all(color: Colors.lightGreen,width: 3)
// //     ),
// //     padding:EdgeInsets.all(20) ,
// //     //margin: EdgeInsets.only(left: 30),
// //     //color: Colors.amber,
// //     child: Text("this is test",style: TextStyle(fontSize: 30),),
// //   ),
// // ),
// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           spacing: 20,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text(
//                       "Hello Flutter",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     backgroundColor: Color.fromARGB(255, 202, 137, 215),
//                   ),
//                 );
//               },
//               child: const Text("Show Message"),
//             ),

//             TextButton(
//               onPressed: () {
//                 print("Login");
//               },
//               child: const Text("Login"),
//             ),
//             OutlinedButton(
//               onPressed: () {
//                 print("Register");
//               },
//               child: const Text("Register"),
//             ),
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Laptop",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     const Text("Price: 25000 EGP"),

//                     ElevatedButton(
//                       onPressed: () {
//                         print("Laptop");
//                       },
//                       child: const Text("Buy"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showMaterialBanner(
//                   MaterialBanner(
//                     content: const Text("Welcome to the app"),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           ScaffoldMessenger.of(
//                             context,
//                           ).hideCurrentMaterialBanner();
//                         },
//                         child: const Text("CLOSE"),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: const Text("Show Banner"),
//             ),

//             ElevatedButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         ListTile(
//                           title: const Text("Camera"),
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),

//                         ListTile(
//                           title: const Text("Gallery"),
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: const Text("Choose Image"),
//             ),

//             IconButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: const Text("Logout"),
//                       content: const Text("Do you want to logout?"),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("No"),
//                         ),

//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             print("Logout");
//                           },
//                           child: const Text("Yes"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               icon: const Icon(Icons.logout),
//             ),

//             //   Image.asset(
//             //     "assets/images/gettyimages-114091224-612x612.jpg",
//             //     height: 400,
//             //     width: 300,
//             //   ),
//             //   Text(
//             //     "اهلا بك اضغط هنا",
//             //     style: TextStyle(
//             //       fontFamily: "Cairo",
//             //       fontSize: 40,
//             //       fontWeight: FontWeight.w900,
//             //       color: Colors.deepOrange,
//             //     ),
//             //   ),
//             //   Expanded(
//             //     child: Lottie.asset(
//             //       "assets/animations/Alphabet A.json",
//             //       height: 400,
//             //     ),
//             //   ),
//           ],
//         ),
//       ),
//       // Container(
//       //   color: Colors.blueGrey,
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     // crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Expanded(
//       //         child: Container(
//       //           width: 100,
//       //           height: 100,
//       //           color: Colors.deepPurpleAccent,
//       //           alignment: Alignment.center,
//       //           child: Text(
//       //             "1",
//       //             style: TextStyle(fontSize: 20, color: Colors.white),
//       //           ),
//       //         ),
//       //       ),

//       //       Spacer(),
//       //       Expanded(
//       //         child: Container(
//       //           width: 200,
//       //           height: 100,
//       //           color: Colors.amberAccent,
//       //           alignment: Alignment.center,
//       //           child: Text(
//       //             "2",
//       //             style: TextStyle(fontSize: 20, color: Colors.white),
//       //           ),
//       //         ),
//       //       ),

//       //       // SizedBox(height: 20),
//       //       Spacer(),
//       //       Flexible(
//       //         child: Container(
//       //           width: 300,
//       //           height: 400,
//       //           color: const Color.fromARGB(255, 212, 118, 18),
//       //           alignment: Alignment.center,
//       //           child: Text(
//       //             "3",
//       //             style: TextStyle(fontSize: 20, color: Colors.white),
//       //           ),
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
///////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: "Undo",
                          backgroundColor: Colors.red,
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                          },
                        ),
                        persist: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        margin: EdgeInsets.only(bottom: 300),
                        dismissDirection: DismissDirection.horizontal,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                        content: Text(
                          "This is a test!!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Show snack bar",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearMaterialBanners();
                    ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        backgroundColor: Colors.red,
                        margin: EdgeInsets.all(20),
                        leading: Icon(Icons.import_contacts),
                        content: Text('This is a material'),
                        actions: [
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).clearMaterialBanners();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Show Material banner",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text("TEst"),

                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Exit"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "show Dialog",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      isDismissible: false,
                      showDragHandle: true,
                      builder: (context) => Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.green,
                        child: Text("data"),
                      ),
                    );
                  },
                  child: Text(
                    "show Model bottom Sheet",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage2()),
                );
              },
              child: Text("Go TO page 2"),
            ),
          ],
        ),
      ),
    );
  }
}

class TestPage2 extends StatelessWidget {
  const TestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Card(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: "Undo",
                          backgroundColor: Colors.red,
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                          },
                        ),
                        persist: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        margin: EdgeInsets.only(bottom: 300),
                        dismissDirection: DismissDirection.horizontal,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                        content: Text(
                          "This is a test!!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "PAge 2",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
