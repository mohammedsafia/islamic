import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      body: IntroductionScreen(
        globalBackgroundColor: Color(0xff202020),
        pages: [
          PageViewModel(
            image: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset('assets/onboarding/icon.png'),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/onboarding/Frame.png'),
                    ),
                  ],
                ),
              ),
            ),
            title: 'Welcome to Islami',
            body: '',
            decoration: pageDecoration(),
          ),

          PageViewModel(
            image: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/onboarding/icon.png'),
                ),
                const SizedBox(height: 16),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/onboarding/Frame1.png'),
                ),
              ],
            ),
            title: 'Welcome to Islami',
            body: 'We Are Excited To Have You In Our community',
            decoration: pageDecoration(),
          ),
          PageViewModel(
            image: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/onboarding/icon.png'),
                ),
                const SizedBox(height: 16),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/onboarding/Frame3.png'),
                ),
              ],
            ),
            title: 'Reading the Quran',
            body: 'Read, and your Lord is the Most Generous',
            decoration: pageDecoration(),
          ),

          PageViewModel(
            image: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/onboarding/icon.png'),
                ),
                const SizedBox(height: 16),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/onboarding/Frame4.png'),
                ),
              ],
            ),
            title: 'Bearish',
            body: 'Praise the name of your Lord, the Most High',
            decoration: pageDecoration(),
          ),

          PageViewModel(
            image: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/onboarding/icon.png'),
                ),
                const SizedBox(height: 16),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/onboarding/Frame5.png'),
                ),
              ],
            ),
            title: 'Holy quran Radio',
            body:
                'You can listen to the Holy Quran Radio through the application for free and easily',
            decoration: pageDecoration(),
          ),
        ],

        showSkipButton: true,
        skip: Text(
          'skip',
          style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 15),
        ),
        next: Text(
          'Next',
          style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 15),
        ),
        done: Text(
          'finish',
          style: TextStyle(color: Color(0xFFE2BE7F), fontSize: 15),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: Color(0xFFE2BE7F),
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onDone: () {
          Navigator.pushReplacementNamed(context, '/main_screen');
        },
      ),
    );
  }
}

PageDecoration pageDecoration() {
  return const PageDecoration(
    imageFlex: 3,
    bodyFlex: 1,
    //titlePadding: EdgeInsets.only(top: 50,),
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE2BE7F),
    ),
    bodyTextStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Color(0xFFE2BE7F),
    ),
  );
}
