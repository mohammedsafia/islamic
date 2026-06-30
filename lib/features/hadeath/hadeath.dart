import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamic/features/hadeath/hadeath_detailed.dart';
import 'hadeath_title.dart';

class HadeathPage extends StatefulWidget {
  const HadeathPage({super.key});

  @override
  State<HadeathPage> createState() => _HadeathPageState();
}

class _HadeathPageState extends State<HadeathPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: hadeathTitle.length,
            itemBuilder: (context, index, realIndex) {
              return FutureBuilder<String>(
                future: rootBundle.loadString(
                  'assets/Hadeeth/h${index + 1}.txt',
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff202020),
                      ),
                    );
                  }

                  // if (snapshot.hasError || !snapshot.hasData) {
                  //   return const Center(child: Text("Error loading file"));
                  // }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HadeathDetailed(index: index),
                        ),
                      );
                    },
                    child: Container(
                      width: 313.34.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xFFE2BE7F),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              'assets/hadeath_frame.png',
                              fit: BoxFit.fill,
                              width: 313.34.w,
                              height: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(25.w),
                            child: SingleChildScrollView(
                              child: Text(
                                snapshot.data!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xff202020),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            options: CarouselOptions(
              height: 618.h,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:islamic/features/hadeath/hadeath_detailed.dart';
// import 'hadeath_title.dart';

// class HadeathPage extends StatefulWidget {
//   const HadeathPage({super.key});

//   @override
//   State<HadeathPage> createState() => _HadeathPageState();
// }

// class _HadeathPageState extends State<HadeathPage> {
//   String hadeathData = '';
//   @override
//   void initState() {
//     super.initState();
//   }

//   itemBuilder: (context, index, realIndex) {

//   return FutureBuilder(
//     future: rootBundle.loadString(
//       'assets/Hadeeth/h${index + 1}.txt',
//     ),
//     builder: (context, snapshot) {

//       if (!snapshot.hasData) {
//         return const Center(
//           child: CircularProgressIndicator(
//             color: Color(0xFFE2BE7F),
//           ),
//         );
//       }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 20.h),
//         Expanded(
//           child: CarouselSlider.builder(
//             itemCount: hadeathTitle.length,
//             itemBuilder: (context, index, realIndex) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HadeathDetailed(index: index),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 313.34.w,
//                   margin: EdgeInsets.symmetric(horizontal: 5.w),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.r),
//                     color: Color(0xFFE2BE7F),
//                   ),
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20.r),
//                         child: ClipRRect(
//                           child: Image.asset(
//                             'assets/hadeath_frame.png',
//                             fit: BoxFit.fill,
//                             width: 313.34.w,
//                             height: double.infinity,
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(9.0),
//                               // child: Image.asset(
//                               //   'assets/Hadeeth/h${index + 1}.png',
//                               // ),
//                             ),
//                             SizedBox(height: 10.h),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },

//             options: CarouselOptions(
//               height: 618.h,
//               enlargeCenterPage: true,
//               viewportFraction: 0.7,
//               enableInfiniteScroll: true,
//               initialPage: 0,
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               scrollDirection: Axis.horizontal,
//             ),
//           ),
//         ),
//         SizedBox(height: 20.h),
//       ],
//     );
//   }
// }
