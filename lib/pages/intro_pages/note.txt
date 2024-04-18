import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';

class Intro_page3 extends StatelessWidget {
  const Intro_page3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
      theChild: 
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Image.asset('assets/logos/SyncUp_logo.png', width: screenWidth * 0.2,),
              const Text("SyncUp",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),),
              Image.asset('assets/images/intro3.png', width: screenWidth * 0.8, height: screenHeight * 0.3, fit: BoxFit.fill,),
              const Text("Benefits of Using SyncUp",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              textAlign: TextAlign.left,),
              const Text("Inclusive:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Everyone's a photographer, capturing moments that matter.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,),
                const Text("Affordable:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Say goodbye to expensive photography services.",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,),
                const Text("Simple:",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,),
                const Text("Easy to use, even if you're new to social media platforms.**Immersive:** Feel the vibe of the event through a collaborative gallery.",
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