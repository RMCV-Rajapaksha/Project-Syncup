// Project id -syncup-f1a48
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_syncup/commponent/Navbar.dart';
import 'package:project_syncup/pages/Album.dart';
import 'package:project_syncup/pages/CreateEvent.dart';
import 'package:project_syncup/pages/Home.dart';
import 'package:project_syncup/pages/Login.dart';
import 'package:project_syncup/pages/Onboarding.dart';
import 'package:project_syncup/pages/Sign.dart';
import 'package:project_syncup/pages/intro_pages/page1.dart';
import 'package:project_syncup/pages/intro_pages/page2.dart';
import 'package:project_syncup/pages/intro_pages/page3.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_preview/device_preview.dart';
// Replace with the correct path

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => Home(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateEvent();
  }
}
