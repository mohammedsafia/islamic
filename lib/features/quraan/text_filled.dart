import 'package:flutter/material.dart';

class TextFilled extends StatelessWidget {
  const TextFilled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.only(right: 20),
              child:SizedBox(
                height: 55,
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white), 
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE2BE7F)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFE2BE7F)),
                    ),
                    prefixIcon: Image.asset('assets/icons/ic_hadeth.png',
                    height: 20,
                    width: 20,
                    ),
                    hintText: 'Sura Name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400 
                    )
                  ) 
                ),
              ),);
  }

}