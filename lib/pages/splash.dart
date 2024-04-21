import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:project_syncup/pages/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
  await Future.delayed(const Duration(milliseconds: 3000), () {});
  if (Navigator.canPop(context)) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login())
    );
  }
}
x

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Template(
      screenWidth: screenWidth, 
      screenHeight: screenHeight, 
      theChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/SyncUp_logo.png',
                width: screenWidth * 0.2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20 ),
                child: Text('SyncUp',
                    style: TextStyle(
                        color: Color(0xff39414e),
                        fontSize: 48,
                        fontWeight: FontWeight.w400),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("from",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Inception",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ],
      )
      );
  }
}