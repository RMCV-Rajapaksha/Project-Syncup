import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:project_syncup/commponent_delete/Button.dart';
import 'package:share_plus/share_plus.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  TextEditingController urlController = TextEditingController(text: '');
  String data = 'Hello my first QR';
  final GlobalKey _qrKey = GlobalKey();
  Directory externalDir = Directory('/storage/emulated/0/Download/Qr_code');

  void shareLink() {
    if (data.isNotEmpty) {
      Share.share(data);
    } else {
      const snackBar = SnackBar(content: Text('Please generate a QR code first'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _captureAndSavePng() async {
    try {
      RenderRepaintBoundary boundary = _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
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
        Opacity(
          opacity: 0.85,
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(57, 189, 176, 0.8),
                  Color.fromRGBO(35, 92, 163, 0.8),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.125,
                  width: screenWidth,
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Background.png'),
                      fit: BoxFit.cover, // Ensure the image covers the entire container
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.275,
                  width: screenWidth,
                ),
              ],
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: RepaintBoundary(
                  key: _qrKey,
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
      ],
    );
  }
}
