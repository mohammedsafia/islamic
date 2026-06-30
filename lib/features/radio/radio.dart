import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/features/radio/radio_list.dart';
import 'package:islamic/features/radio/rectire_list.dart';

class RadioPage extends StatefulWidget {
  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTabItem(title: 'Radio', index: 0),
                buildTabItem(title: 'Reciters', index: 1),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                RadioList(),    
                RecitersList(), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({required String title, required int index}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 170.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? Color(0xFFE2BE7F) : Colors.black45,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Color(0xFF202020) : Colors.white70,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
