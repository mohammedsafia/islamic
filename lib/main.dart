import 'package:flutter/material.dart';
import 'package:islamic/features/hadeath/hadeath_detailed.dart';
import 'package:islamic/features/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic/onboarding.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const OnboardingScreen(),
            '/main_screen': (context) => const MainScreen(),
            HadeathDetailed.routeName: (context) {
              final index = ModalRoute.of(context)!.settings.arguments as int;
              return HadeathDetailed(index: index);
            },
          },
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.black,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Home Screen')));
  }
}
//pub.dev
//pageviewmodel
//rrotbandle