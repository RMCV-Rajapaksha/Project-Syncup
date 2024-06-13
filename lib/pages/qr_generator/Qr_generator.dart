import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/Button.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_syncup/pages/Home.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  TextEditingController urlController = TextEditingController();

  Function shareLink() {
    return () {};
  }

  void navigateBack() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "QR Generator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            const Text(
              "Enter the text you want to convert to QR code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomButton(
              text: "Generate QR",
              onPressed: () {
                setState(() {});
              },
              height: screenHeight * 0.1,
              width: screenWidth * 0.4,
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: QrImageView(
                data: urlController.text,
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Share",
                  onPressed: shareLink,
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                ),
                CustomButton(
                  text: "Save",
                  onPressed: navigateBack,
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.3,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            const Text(
                  "Developed by SyncUp",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
            ),
          ],
        ),
      ),
    );
  }
}
