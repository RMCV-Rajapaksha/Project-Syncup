import 'package:flutter/cupertino.dart';
import 'package:project_syncup/commponent/theme.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Template( 
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
      theChild: const Center(
        child: Text(
          'This is a temporary page',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      );
  }
}