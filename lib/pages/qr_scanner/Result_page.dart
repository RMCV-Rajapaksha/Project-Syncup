import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultPage extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultPage({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: closeScreen,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: code, size: 200),
            const SizedBox(height: 20),
            const Text(
              "Scanned Result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              code.isNotEmpty ? code : "The result of the scanned QR code will be displayed here",
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Implement copy functionality
                },
                child: const Text(
                  "Copy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
