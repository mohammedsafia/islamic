import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/features/radio/models/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';

class RadioList extends StatefulWidget {
  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? playingIndex; 
  bool isPlaying = false;
  List<RadioModel> radios = []; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRadios(); 
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  Future<void> fetchRadios() async {
    try {
      var response = await Dio().get('https://mp3quran.net/api/v3/radios');
      if (response.statusCode == 200) {
        List data = response.data['radios'];
        setState(() {
        
          radios = data.map((e) => RadioModel.fromJson(e)).toList();
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error: $e");
      setState(() => isLoading = false);
    }
  }
  Future<void> playRadio(int index) async {
  
    if (playingIndex == index && isPlaying) {
      await _audioPlayer.pause();
      setState(() => isPlaying = false);
      return;
    }

    
    try {
      await _audioPlayer.play(UrlSource(radios[index].radioUrl));
      setState(() {
        playingIndex = index;
        isPlaying = true;
      });
    } catch (e) {
      debugPrint("Audio Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: Color(0xFFE2BE7F)));
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical:10.h),
      itemCount: radios.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        var radio = radios[index];

        return Container(
          height: 100.h,
          width: 390.w,
          decoration: BoxDecoration(
            color: const Color(0xFFE2BE7F),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
            
              Positioned.fill(
                child: Opacity(
                  opacity: .18,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset('assets/radio/radio.png', fit: BoxFit.cover,color: Colors.black,),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    radio.radioName,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.sp, 
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF202020),
                    ),
                  ),
                  // SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              
                      IconButton(
                        icon: Icon(
                          (playingIndex == index && isPlaying)
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                          size: 45.sp,
                          color: const Color(0xFF202020),
                        ),
                        onPressed: () => playRadio(index), 
                      ),
                      SizedBox(width: 10.w),
                      IconButton(
                        icon: const Icon(
                          
                          Icons.volume_up, size: 25,color: Color(0xFF202020),),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}