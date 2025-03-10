import 'package:flutter/material.dart';
import 'package:project_syncup/commponent/Button.dart';
import 'package:project_syncup/commponent/Input.dart';
import 'package:project_syncup/commponent/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:project_syncup/logics/Functions.dart';
import 'package:project_syncup/logics/databse/EventDatabaseConnection.dart';
import 'package:project_syncup/logics/databse/UserDatabaseConnection.dart';

final _formKey = GlobalKey<FormState>();

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

// Database connections
Functions functions = Functions();
DatabaseConnection databaseConnection = DatabaseConnection();
Users user = Users();

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> _eventTypes = [
    'Birthday',
    'Trip',
    'Wedding',
    'Conference',
    'Gathering'
  ];
  final Map<String, String> _eventImages = {
    'Birthday': 'assets/images/Birthday.jpeg',
    'Trip': 'assets/images/Trip.jpeg',
    'Wedding': 'assets/images/Wedding.jpeg',
    'Conference': 'assets/images/Conference.jpeg',
    'Gathering': 'assets/images/Gathering.jpeg',
  };
  String? _selectedEventType;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String selectedImage =
        _eventImages[_selectedEventType] ?? 'assets/images/placeholder.jpeg';

    Users user = Users();
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
                        height: screenHeight * 0.16,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(selectedImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: 'Event Type',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(53, 131, 169, 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
                      filled: true,
                    ),
                    value: _selectedEventType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEventType = newValue;
                      });
                    },
                    items: _eventTypes
                        .map<DropdownMenuItem<String>>((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Event Name',
                    controller: _eventNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomInputField(
                    hintText: 'Description',
                    controller: _descriptionController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Create',
                    onPressed: () async {
                      String type = _selectedEventType ?? " ";
                      String name = _eventNameController.text;
                      String id = functions.createEventId(type, name);

                      user.addEventToUser("fguyghdasf", id);
                      databaseConnection.addEvent(id, "user email", type, name,
                          _descriptionController.text, "add url");
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
