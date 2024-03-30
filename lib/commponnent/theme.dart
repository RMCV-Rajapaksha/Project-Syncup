import 'dart:ui';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  const Template(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.theChild});
  final screenWidth;
  final screenHeight;
  final theChild;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.white,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.85,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(57, 189, 176, 0.8),
                          Color.fromRGBO(35, 92, 163, 0.8),
                        ]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.125,
                        width: screenWidth,
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Background.png'),
                            fit: BoxFit
                                .cover, // Ensure the image covers the entire container
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.275,
                        width: screenWidth,
                      )
                    ],
                  ),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container()),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05)
                    ])),
              ),
              Center(child: theChild)
            ],
          )),
    );
  }
}
