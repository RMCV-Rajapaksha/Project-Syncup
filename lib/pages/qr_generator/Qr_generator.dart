import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Template(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
      theChild: const Padding(
        padding: EdgeInsets.all(30) ,
        child: Column(
          children: [
            Text(
              "QR Generator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter the text you want to convert to QR code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 20),
            Center(

            ),
          ],),

        
        )
      );
  }
}
