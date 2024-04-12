import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //controller to kee track which page we're on
  PageController _controller = PageController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.green,
                ),
              ],),

              Container(
                alignment: Alignment(0, 0.75),
                child: 
              SmoothPageIndicator(controller: _controller, count: 3)),
          ],
        )
          );
  }
}