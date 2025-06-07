import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_syncup/pages_delete/Album.dart';
import 'package:project_syncup/pages_delete/Home.dart';
import 'package:project_syncup/pages_delete/Login.dart';
import 'package:project_syncup/pages_delete/qr_generator/Qr_generator.dart';
import 'package:project_syncup/pages_delete/qr_scanner/Qr_scanner.dart';

class Template extends StatelessWidget {
  Template({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.theChild,
  });
  final screenWidth;
  final screenHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ClipRRect(
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
                                image:
                                    AssetImage('assets/images/Background.png'),
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
                  Center(child: theChild),
                ],
              )),
        ),
      ),
      routes: {
        '/home': (context) => Home(),
        '/qrgenerator': (context) => const QrGenerator(),
        '/qrscanner': (context) => const QrScanner(),
        '/login' :(context) => const Login(),
        '/album' :(context) => const Album(),
      },
    );
  }
}
