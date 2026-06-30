import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HadithArgs {
//   final int index;
//   final String title;
//   HadithArgs({required this.index, required this.title});
// }

class HadeathDetailed extends StatefulWidget {
  static const String routeName = '/hadith_details';

  final int index;
  const HadeathDetailed({super.key, required this.index}) ;
  

  @override
  State<HadeathDetailed> createState() => _HadeathDetailedState();
}

class _HadeathDetailedState extends State<HadeathDetailed> {
  String hadeathData = '';

  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final arguments = ModalRoute.of(context)?.settings.arguments;

  //   if (arguments is HadithArgs && hadeathData.isEmpty) {
  //     reeadHadith(arguments.index);
  //   }
  // }
  @override
  void initState() {
    super.initState();
    reeadHadith();  
  }

  Future<void> reeadHadith() async {
    String data = await rootBundle.loadString(
      'assets/Hadeeth/h${widget.index + 1}.txt',
    );

    setState(() {
      hadeathData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as HadithArgs?;

    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff202020),
        iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
        title: Text(
          'Hadeeth',
          style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/sura_frame.png', fit: BoxFit.fill)),
          Align(
            alignment: Alignment.topCenter,
            child: hadeathData.isEmpty
                ? const CircularProgressIndicator(color: Color(0xFFE2BE7F))
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 35.w,
                      vertical: 60.h,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        hadeathData,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFE2BE7F),
                          fontSize: 20.sp,
                          // height: 1.6,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HadithArgs {
//   final int index;
//   final String title;
//   HadithArgs({required this.index, required this.title});
// }

// class HadeathDetailed extends StatefulWidget {
//   static const String routeName = '/hadith_details';
//   // ignore: use_super_parameters
//   const HadeathDetailed({Key? key}) : super(key: key);

//   @override
//   State<HadeathDetailed> createState() => _HadeathDetailedState();
// }

// class _HadeathDetailedState extends State<HadeathDetailed> {
//   String hadeathData = ''; 

//   @override
//  void didChangeDependencies() {
//   super.didChangeDependencies();
//   final arguments = ModalRoute.of(context)?.settings.arguments;
  
//   if (arguments is HadithArgs) {
//     reeadHadith(arguments.index);
//   }
// }
    

//   Future<String> reeadHadith(int index) async {
//     String data = await rootBundle.loadString('assets/Hadeeth/h${index + 1}.txt');
//     setState(() {
//     });
//     return data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as HadithArgs;

//     return Scaffold(
//       // backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
//         title: Text(args.title, style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20.sp)),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset('assets/sura_frame.png', fit: BoxFit.fill),
//           ),
//           Center(
//             child: hadeathData.isEmpty
//                 ? const CircularProgressIndicator(color: Color(0xFFE2BE7F))
//                 : SingleChildScrollView(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
//                     child: Text(
//                       hadeathData,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 20.sp, height: 1.6),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }