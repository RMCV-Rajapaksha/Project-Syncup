import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';

class Intro_page1 extends StatelessWidget {
  const Intro_page1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
      theChild: 
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset('assets/logos/SyncUp_logo.png', width: screenWidth * 0.2,),
              const Text("SyncUp",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),),
              const Text("Capture and Share Your Journey, Together.",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),),
              const Text("Join a community where your memories become part of a larger story. Connect with friends, family, and fellow event-goers by sharing your photos and videos in real-time. Experience events from every angle, through the eyes of all participants.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),),
            ],
          ),
        )
      );
  }
}