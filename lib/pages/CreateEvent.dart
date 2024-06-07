import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/Button.dart';
import 'package:project_syncup/commponent/Input.dart';
import 'package:project_syncup/commponent/theme.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final _formKey = GlobalKey<FormState>();

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _LoginState();
}

class _LoginState extends State<CreateEvent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
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
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Create New Event',
                    style: TextStyle(
                      color: const Color.fromRGBO(57, 65, 78, 1),
                      fontSize: screenHeight * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.005),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      child: Container(
                        height: screenHeight * 0.14,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/cake.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Event Type',
                    controller: _firstNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Event Name',
                    controller: _lastNameController,
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Description',
                    controller: _emailController,
                    obscureText: true,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Create',
                    onPressed: () async {
                      var db = FirebaseFirestore
                          .instance; // Create a new user with a first and last name
                      final user = <String, dynamic>{
                        "first": "Alan",
                        "middle": "Mathison",
                        "last": "Turing",
                        "born": 1912
                      };

// Add a new document with a generated ID
                      db.collection("users").add(user).then((DocumentReference
                              doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                    },
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.06,
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
