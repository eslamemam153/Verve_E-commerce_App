import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// body: Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Container(
//     width: 200,
//     height: 200,
//     alignment: Alignment.centerRight,
//     decoration: BoxDecoration(
//       color: Colors.teal,
//       borderRadius: BorderRadius.circular(50),
//       border: Border.all(color: Colors.lightGreen,width: 3)
//     ),
//     padding:EdgeInsets.all(20) ,
//     //margin: EdgeInsets.only(left: 30),
//     //color: Colors.amber,
//     child: Text("this is test",style: TextStyle(fontSize: 30),),
//   ),
// ),
class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/gettyimages-114091224-612x612.jpg",
              height: 400,
              width: 300,
            ),
            Text(
              "اهلا بيك يا عزيزي",
              style: TextStyle(
                fontFamily: "Cairo",
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange,
              ),
            ),
            Expanded(
              child: Lottie.asset(
                "assets/animations/Alphabet A.json",
                height: 400,
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   color: Colors.blueGrey,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         child: Container(
      //           width: 100,
      //           height: 100,
      //           color: Colors.deepPurpleAccent,
      //           alignment: Alignment.center,
      //           child: Text(
      //             "1",
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           ),
      //         ),
      //       ),

      //       Spacer(),
      //       Expanded(
      //         child: Container(
      //           width: 200,
      //           height: 100,
      //           color: Colors.amberAccent,
      //           alignment: Alignment.center,
      //           child: Text(
      //             "2",
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           ),
      //         ),
      //       ),

      //       // SizedBox(height: 20),
      //       Spacer(),
      //       Flexible(
      //         child: Container(
      //           width: 300,
      //           height: 400,
      //           color: const Color.fromARGB(255, 212, 118, 18),
      //           alignment: Alignment.center,
      //           child: Text(
      //             "3",
      //             style: TextStyle(fontSize: 20, color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
