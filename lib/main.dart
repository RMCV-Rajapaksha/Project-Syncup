import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_syncup/commponent/Navbar.dart';
import 'package:project_syncup/pages/Login.dart';
import 'package:project_syncup/pages/Onboarding.dart';
import 'package:project_syncup/pages/intro_pages/page1.dart';
import 'package:project_syncup/pages/intro_pages/page2.dart';
import 'package:project_syncup/pages/intro_pages/page3.dart';

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Future.delayed(
  //   const Duration(seconds: 2)
  //   );
  //   FlutterNativeSplash.remove();


  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => Login(),
    ),
  );
}
