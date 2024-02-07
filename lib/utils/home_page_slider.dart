// import 'package:flutter/material.dart';
// import 'package:dots_indicator/dots_indicator.dart';
//
// class ImageSliderWithDots extends StatefulWidget {
//   @override
//   _ImageSliderWithDotsState createState() => _ImageSliderWithDotsState();
// }
//
// class _ImageSliderWithDotsState extends State<ImageSliderWithDots> {
//   final _imagePaths = [
//     'assets/pageview.JPEG', // Replace with your image paths
//     'assets/pageview.JPEG', // Replace with your image paths
//     'assets/pageview.JPEG', // Replace with your image paths
//     'assets/pageview.JPEG', // Replace with your image paths
//   ];
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         PageView.builder(
//
//
//           itemCount: _imagePaths.length,
//           itemBuilder: (context, index) {
//             return Image.asset(_imagePaths[index], fit: BoxFit.fill, height: 50);
//           },
//           onPageChanged: (page) {
//             setState(() {
//               _currentPage = page;
//             });
//           },
//         ),
//         Positioned(
//           bottom: 20,
//           left: 0,
//           right: 0,
//           child: DotsIndicator(
//             dotsCount: _imagePaths.length,
//             position: _currentPage,
//             decorator: DotsDecorator(
//               color: Colors.grey, // Inactive dot color
//               activeColor: Colors.blue, // Active dot color
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }