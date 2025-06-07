import 'package:flutter/material.dart';
import 'package:project_syncup/commponent_delete/theme.dart';

class Intro_page3 extends StatelessWidget {
  const Intro_page3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        theChild: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Align children to the start (left) of the column
            children: [
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logos/SyncUp_logo.png',
                        width: screenWidth * 0.2,
                      ),
                      const Text(
                        "SyncUp",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 48,
                        ),
                      ),
                      Image.asset(
                        'assets/images/intro3.png',
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.3,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "Benefits of Using SyncUp",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                "Customize settings for easy navigation and personalized interaction",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ));
  }
}
