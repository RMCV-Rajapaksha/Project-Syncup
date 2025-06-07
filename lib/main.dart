// Project id -syncup-f1a48
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_syncup/pages_delete/Create.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:project_syncup/commponent_delete/Navbar.dart';
import 'package:project_syncup/pages_delete/Album.dart';
import 'package:project_syncup/pages_delete/CreateEvent.dart';
import 'package:project_syncup/pages_delete/Home.dart';
import 'package:project_syncup/pages_delete/Login.dart';
import 'package:project_syncup/pages_delete/Onboarding.dart';
import 'package:project_syncup/pages_delete/qr_generator/Qr_generator.dart';
import 'package:project_syncup/pages_delete/qr_scanner/Qr_scanner.dart';
import 'package:project_syncup/pages_delete/qr_scanner/test.dart';
import 'package:project_syncup/pages_delete/Sign.dart';
import 'package:project_syncup/views/intro_pages/page1.dart';
import 'package:project_syncup/views/intro_pages/page2.dart';
import 'package:project_syncup/views/intro_pages/page3.dart';

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
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Album(),
    );
  }
}
