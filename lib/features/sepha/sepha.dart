import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SephaPage extends StatefulWidget {
  
  @override
  State<SephaPage> createState() => _SephaPageState();
}

class _SephaPageState extends State<SephaPage> {
  @override
void initState() {
  super.initState();
  // audioPlayer.setSource(AssetSource('audio/audio1.wav'));
}
  // final AudioPlayer audioPlayer = AudioPlayer();
  int count = 0;
  int zekrcount = 0;

  List<String> zekr = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: ()  {
              //  audioPlayer.play(AssetSource('assets/audio/audio1.wav'));
              count++;
              if (count == 30) {
                count = 0;
                zekrcount++;
                if (zekrcount == zekr.length) {
                  zekrcount = 0;
                }
              }
              setState(() {});
            },

            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/Sebha.png', height: 381.h),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Text(
                        zekr[zekrcount],
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      //     SizedBox(height: 10.h),
                      //     GestureDetector(
                      //   onTap: () {
                      //     count++;
                      //     if (count == 30) {
                      //       count = 0;
                      //       zekrcount++;
                      //       if (zekrcount == zekr.length) {
                      //         zekrcount = 0;
                      //       }
                      //     }

                      //     setState(() {});
                      //   },
                      //   child: Text(
                      //     '$count',
                      //     style: TextStyle(
                      //       fontSize: 36.sp,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
