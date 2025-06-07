import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:project_syncup/commponent_delete/theme.dart';

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
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_backspace_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      // Handle search button pressed
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'chmara',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 170,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        Image.asset('assets/images/Background.png').image,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  '1 FEB 12:00',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 39, 75, 105)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 39, 75, 105)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                      'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 39, 75, 105)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        'afcemvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfkfnln'),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
