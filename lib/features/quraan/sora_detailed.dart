import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/features/quraan/models/list_item_model.dart';
import 'package:islamic/features/quraan/models/title-model.dart';

class SoraDetailed extends StatefulWidget {
  final int index;
  const SoraDetailed({super.key, required this.index});

  @override
  State<SoraDetailed> createState() => _SoraDetailedState();
}

class _SoraDetailedState extends State<SoraDetailed> {
  String souraData = '';

  @override
  void initState() {
    reeadSouraAyat();
    super.initState();
  }

  Future<void> reeadSouraAyat() async {
    final String data = await rootBundle.loadString(
      'assets/sora/${widget.index + 1}.txt',
      // 'assets/Suras/${widget.index + 1}.txt',
    );
    setState(() {
      souraData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
        title: Text(
          titleModel[widget.index].suraTitle,
          style: const TextStyle(color: Color(0xFFE2BE7F), fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff202020),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/sura_frame.png', fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: souraData.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFFE2BE7F)),
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 60,
                        horizontal: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            suras[widget.index].nameAr,
                            style: const TextStyle(
                              color: Color(0xFFE2BE7F),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 42.sp),
                          Text(
                            souraData,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFE2BE7F),
                              fontSize: 22,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
