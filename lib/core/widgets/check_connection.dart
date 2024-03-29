// import 'package:be3ly/core/core/assets/app_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CheckConnection extends StatelessWidget {
//   const CheckConnection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 150.h,
//           ),
//           Image.asset(
//             AppAssets.noConnection,
//             width: double.infinity - 100,
//             height: 400.h,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Text(
//             'No Internet connection',
//             style: Theme.of(context)
//                 .textTheme
//                 .titleLarge!
//                 .copyWith(fontWeight: FontWeight.w600),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             "Check your connection, then refresh the page.. ",
//           )
//               .animate()
//               .fadeIn() // uses `Animate.defaultDuration`
//               .scale() // inherits duration from fadeIn
//               .move(delay: 300.ms, duration: 600.ms),
//         ],
//       ),
//     );
//   }
// }
