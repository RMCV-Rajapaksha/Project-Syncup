import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:project_syncup/commponent/theme.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isDialOpen = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: SpeedDial(
          overlayColor: Colors.transparent,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: const IconThemeData(size: 22.0),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.camera_alt, size: 20),
              backgroundColor: const Color.fromARGB(255, 75, 73, 73),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'Update Now',
              labelStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Color.fromARGB(0, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150),
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.qr_code),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'Scan QR',
              labelStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SpeedDialChild(
              child: const Icon(Icons.camera_alt, size: 20),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'camera',
              labelStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.add, size: 20),
              backgroundColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'New event',
              labelStyle: const TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
