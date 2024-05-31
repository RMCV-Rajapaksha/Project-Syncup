import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_syncup/commponent/Input.dart';
import 'package:project_syncup/commponent/MainCard.dart';
import 'package:project_syncup/commponent/Navbar.dart';
import 'package:project_syncup/commponent/theme.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _NavbarState();
}

class _NavbarState extends State<Home> {
  final TextEditingController _eventSearch = TextEditingController();

  final List<Map<String, String>> events = [
    {
      'title': 'Birthday Party',
      'date': '12/12/2021',
      'image': 'assets/images/cake.jpg'
    },
    {
      'title': 'Wedding Ceremony',
      'date': '15/08/2021',
      'image': 'assets/images/cake.jpg'
    },
    {
      'title': 'Corporate Event',
      'date': '01/01/2022',
      'image': 'assets/images/cake.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: SpeedDialButtons(),
          body: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:
                          screenHeight * 0.025, // Adjust the radius as needed
                      backgroundImage: AssetImage(
                          'assets/logod/SyncUp_logo.png'), // Ensure this path is correct
                    ),
                    SizedBox(width: screenWidth * 0.5),
                    Text(
                      'john doe',
                      style: TextStyle(
                        color: const Color.fromRGBO(57, 65, 78, 1),
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    CircleAvatar(
                      radius:
                          screenHeight * 0.025, // Adjust the radius as needed
                      backgroundImage: AssetImage(
                          'assets/logod/SyncUp_logo.png'), // Ensure this path is correct
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                CustomInputField(
                    hintText: "Search Event", controller: _eventSearch),
                SizedBox(height: screenHeight * 0.01),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return MainCard(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        imagePath: events[index]['image']!,
                        eventTitle: events[index]['title']!,
                        eventDate: events[index]['date']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
