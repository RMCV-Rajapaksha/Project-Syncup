import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_syncup/authentication_delete/auth.dart';
import 'package:project_syncup/commponent_delete/Button.dart';
import 'package:project_syncup/commponent_delete/Input.dart';
import 'package:project_syncup/commponent_delete/theme.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

Authentication _authentication = Authentication();

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.hasData) {
                User? user = snapshot.data;
                if (user == null) {
                  return Text('User is currently signed out!');
                } else {
                  // Get the user ID
                  String userId = user.uid;
                  return Text('User is signed in! User ID: $userId');
                }
              } else {
                return Text('No user data available');
              }
            },
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: const Color.fromRGBO(57, 65, 78, 1),
                      fontSize: screenHeight * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  CustomInputField(
                    hintText: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromRGBO(57, 65, 78, 1),
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Login',
                    onPressed: () async {
                      _authentication.signIn(
                        _emailController.text,
                        _passwordController.text,
                      );
                    },
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.06,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('or'),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.white, width: 2.0),
                        color: const Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/google.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                          const Text(
                            'Login with your google',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(53, 131, 169, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
