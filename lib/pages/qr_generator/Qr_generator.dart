import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_syncup/commponent/Button.dart';
import 'package:project_syncup/commponent/theme.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  TextEditingController urlController = TextEditingController(text: '');
  String data = '';
  final GlobalKey _qrkey = GlobalKey();
  Directory externalDir = Directory('/storage/emulated/0/Download/Qr_code');

  void shareLink() {
    // Implement sharing functionality here
  }

  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary = _qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);

      // Drawing White Background because Qr Code is Black
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
      canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());
      final picture = recorder.endRecording();
      final img = await picture.toImage(image.width, image.height);
      ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Check for duplicate file name to avoid Override
      String fileName = 'qr_code';
      int i = 1;
      while (await File('${externalDir.path}/$fileName.png').exists()) {
        fileName = 'qr_code_$i';
        i++;
      }

      // Check if Directory Path exists or not
      bool dirExists = await externalDir.exists();
      // if not then create the path
      if (!dirExists) {
        await externalDir.create(recursive: true);
      }

      final file = await File('${externalDir.path}/$fileName.png').create();
      await file.writeAsBytes(pngBytes);

      if (!mounted) return;
      const snackBar = SnackBar(content: Text('QR code saved to gallery'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      if (!mounted) return;
      const snackBar = SnackBar(content: Text('Something went wrong!!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            color: Colors.white,
          ),
        ),
        Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: RepaintBoundary(
                    key: _qrkey,
                    child: QrImageView(
                      data: data,
                      version: QrVersions.auto,
                      size: 200.0,
                      backgroundColor: Colors.white,
                    ),
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
                      onPressed: _captureAndSavePng,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
