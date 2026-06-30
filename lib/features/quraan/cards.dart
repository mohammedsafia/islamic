import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSuraCard extends StatelessWidget {
  final String suraNameAr;
  final String suraNameEn;
  final String versesCount;
  final int index;
  final VoidCallback onTap;

  const RecentSuraCard({
    super.key,
    required this.suraNameAr,
    required this.suraNameEn,
    required this.versesCount,
    required this.index,
    required this.onTap
    });  


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      
      
      child: Card(
        child: Container(
          width: 283.w,
          padding: EdgeInsets.only(left: 17.w, right: 6.w, bottom: 7.h, top: 7.h),
          decoration: BoxDecoration(
            color: Color(0xFFE2BE7F),
            borderRadius: BorderRadius.circular(20.r)
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(suraNameAr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 5),
                  Text(suraNameEn,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 10,),
                  Text(versesCount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                  )),
              ]),
              const Spacer(),
              Image.asset('assets/moshaf.png',height: 136.h,width: 153.w,)
            ],
          ),
        ),
      ),
    );
  }
}