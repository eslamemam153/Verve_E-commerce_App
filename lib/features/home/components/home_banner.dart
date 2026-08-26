// import 'package:flutter/material.dart';

// class HomeBanner extends StatelessWidget {
//   const HomeBanner({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 "assets/images/fachry-zella-devandra-GSGBk80Fwlg-unsplash 2.png",
//               ),
//             ),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hot Drops",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//                   ),
//                   Text(
//                     "Must have Sneakers",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                   ),
//                   SizedBox(height: 12),
//                   ActionChip(
//                     label: Text("Find out"),
//                     onPressed: () {},
//                     backgroundColor: Colors.black,
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                     labelStyle: TextStyle(color: Colors.white),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusGeometry.circular(20),
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(child: Image.asset("assets/images/shoe img.png")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/fachry-zella-devandra-GSGBk80Fwlg-unsplash 2.png",
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hot Drops",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Must have Sneakers",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ActionChip(
                      label: const Text("Find out"),
                      onPressed: () {},
                      backgroundColor: colorScheme.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      labelStyle: TextStyle(color: colorScheme.onPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Image.asset("assets/images/shoe img.png")),
            ],
          ),
        ),
      ),
    );
  }
}
