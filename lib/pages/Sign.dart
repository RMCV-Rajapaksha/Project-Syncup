import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_syncup/authentication/auth.dart';
import 'package:project_syncup/commponent/Button.dart';
import 'package:project_syncup/commponent/Input.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:project_syncup/logics/databse/UserDatabaseConnection.dart';

final _formKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Authentication _authentication = Authentication();
  Users _user = Users();
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
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: const Color.fromRGBO(57, 65, 78, 1),
                      fontSize: screenHeight * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up for SyncUp',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 131, 169, 1),
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'First Name',
                    controller: _firstNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Last Name',
                    controller: _lastNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'SingUp',
                    onPressed: () async {
                      _authentication.register(
                        _emailController.text,
                        _passwordController.text,
                      );
                      _user.addUserData(_firstNameController.text,
                          _lastNameController.text, _emailController.text, "");
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
