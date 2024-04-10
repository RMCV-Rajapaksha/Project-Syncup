import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:project_syncup/pages/Create.dart';
import 'package:project_syncup/pages/Login.dart';
import 'package:project_syncup/pages/splash.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const Splash(),
    ),
  );
}
