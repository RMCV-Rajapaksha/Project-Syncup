import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:project_syncup/commponent/theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _LoginState();
}

class _LoginState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Template(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      theChild: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 14.0, right: 14),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        Image.asset('assets/images/Background.png').image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'chmara',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 40,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  '1 FEB 12:00',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
