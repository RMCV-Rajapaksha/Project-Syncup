import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:project_syncup/commponent/theme.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
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
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          backgroundColor: const Color.fromRGBO(53, 131, 169, 1),
          visible: true,
          curve: Curves.bounceIn,
          closeManually: true, // Set this to true
          children: [
            SpeedDialChild(
              child: Icon(Icons.arrow_circle_down_outlined),
              onTap: () {
                Navigator.pushNamed(context, '/create');
              },
              label: 'Change plan',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
            ),
            SpeedDialChild(
              child: Icon(Icons.qr_code),
              backgroundColor: const Color.fromRGBO(53, 131, 169, 1),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'Scan QR',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
            ),
            SpeedDialChild(
              child: Icon(Icons.camera_alt),
              backgroundColor: const Color.fromRGBO(53, 131, 169, 1),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'camera',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
            ),
            SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: const Color.fromRGBO(53, 131, 169, 1),
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              label: 'New event',
              labelStyle: TextStyle(fontSize: 18.0, color: Colors.white),
              labelBackgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
