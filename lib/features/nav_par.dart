import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavPar extends StatelessWidget {
  final int selectedIndex; 
  final Function(int) onTabChanged; 

   NavPar({
    super.key, 
    required this.selectedIndex, 
    required this.onTabChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        currentIndex: selectedIndex, 
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFE2BE7F),
        showUnselectedLabels: false,
        
        onTap: (value) {
          onTabChanged(value);
      
      
        },
       items: [
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_quraan.png',color: Colors.black), 
          label: 'Quran',
          
            activeIcon:
            Padding(
            padding: const EdgeInsets.only(top: 20),
             child: Container(
              height: 25.h,
              width: 54.w,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF202020).withValues(alpha:.5),
                
              ),
              child: Image.asset('assets/icons/ic_quraan.png',color: Colors.white,),
            ),
           )
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_hadeth.png',color: Colors.black), label: 'Hadeth',
            activeIcon:
            Padding(
            padding: const EdgeInsets.only(top: 20),
             child: Container(
              height: 25.h,
              width: 54.w,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF202020).withValues(alpha:.5),
                
              ),
              child: Image.asset('assets/icons/ic_hadeth.png',color: Colors.white,),
            ),
           )
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_sebha.png',color: Colors.black), label: 'Sebha',
            activeIcon:
            Padding(
            padding: const EdgeInsets.only(top: 20),
             child: Container(
              height: 25.h,
              width: 54.w,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF202020).withOpacity( .5),
              ),
              child: Image.asset('assets/icons/ic_sebha.png',color: Colors.white),
            ),
           )
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_radio.png',color: Colors.black), label: 'Radio',
            activeIcon:
            Padding(
            padding: const EdgeInsets.only(top: 20),
             child: Container(
              height: 25.h,
              width: 54.w,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF202020).withValues(alpha:.5),
              ),
              child: Image.asset('assets/icons/ic_radio.png',color: Colors.white),
            ),
           )
          ),
          BottomNavigationBarItem(icon: Image.asset('assets/icons/ic_time.png',color: Colors.black,), label: 'Time',
            activeIcon:
            Padding(
            padding: const EdgeInsets.only(top: 20),
             child: Container(
              height: 28.h,
              width: 54.w,
              decoration:  BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF202020).withValues(alpha:.5),
              ),
              child: Image.asset('assets/icons/ic_time.png',color: Colors.white),
            ),
           )
          ),
        ],
      ),
    );
  }
}