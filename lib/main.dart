import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/Navbar.dart';
import 'package:project_syncup/pages/Login.dart';
import 'package:project_syncup/pages/Onboarding.dart';
import 'package:project_syncup/pages/intro_pages/page1.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => Intro_page1(),
    ),
  );
}
