import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';

class Intro_page2 extends StatelessWidget {
  const Intro_page2({super.key});

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
              Image.asset('assets/images/intro2.png', width: screenWidth * 0.8, height: screenHeight * 0.3, fit: BoxFit.fill,),
              const Text("How SyncUP Works",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              textAlign: TextAlign.left,),
              const Text("Join an Event:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Enter the event code or scan the QR to join the event's live feed.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,),
                const Text("Share Your Moment:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Upload your photos and videos to contribute to the event's collective memory.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,),
                const Text("Relive the Experience:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Browse through a rich tapestry of shared experiences from multiple perspectives.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,),
            ],
          ),
        )
      );
  }
}