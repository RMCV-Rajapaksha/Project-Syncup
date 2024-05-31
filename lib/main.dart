import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_syncup/commponent/Navbar.dart';
import 'package:project_syncup/pages/Album.dart';
import 'package:project_syncup/pages/Home.dart';
import 'package:project_syncup/pages/Login.dart';
import 'package:project_syncup/pages/Onboarding.dart';
import 'package:project_syncup/pages/Sign.dart';
import 'package:project_syncup/pages/intro_pages/page1.dart';
import 'package:project_syncup/pages/intro_pages/page2.dart';
import 'package:project_syncup/pages/intro_pages/page3.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => SignUp(),
    ),
  );
}
