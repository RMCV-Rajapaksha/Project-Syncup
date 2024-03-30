import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_syncup/utils/theme/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _ProductState();
}

class _ProductState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
        screenWidth: screenWidth,
        screenHeight: screenHeight,
        theChild: const Text('SyncUp Login Page',
            style: TextStyle(
                color: Color(0xE4303643),
                fontSize: 30,
                fontWeight: FontWeight.bold)));
  }
}
