import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_syncup/commponnent/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your username',
        ),
      ),
    );
  }
}
