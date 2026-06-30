import 'package:flutter/material.dart';
import 'nav_par.dart';
import 'quraan/quraan.dart';
import 'hadeath/hadeath.dart';
import 'sepha/sepha.dart';
import 'radio/radio.dart';
import 'time/time.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = '/main_screen';


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final List<String> backgrounds = [
    'assets/background/Background.png',
    'assets/background/hadeathBack.png',
    'assets/background/sephaback.png',
    'assets/background/radioback.png',
    'assets/background/timeback.png',
  ];
  final List<Widget> pages = [
    QuraanPage(),
    HadeathPage(),
    SephaPage(),
    RadioPage(),
    TimePage(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar:NavPar (

        selectedIndex: index, 
        onTabChanged: (newIndex) {
          
          setState(() {
            index = newIndex; 
          });
        },
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgrounds[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
            children: [
              Center(
                child: 
                  Image.asset('assets/img_header.png',height: 141,),
              ),
              Expanded(child: pages[index]),
            ],
            ),
          ),
        ],
      ),
    );
  }
}