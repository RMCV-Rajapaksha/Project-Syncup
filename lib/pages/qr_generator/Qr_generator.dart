import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  TextEditingController urlController = TextEditingController();

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
          children: [
            const Text(
              "QR Generator",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Enter the text you want to convert to QR code",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: 
            ),
          ],
        ),
      ),
    );
  }
}