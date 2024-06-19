import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_syncup/logics/databse/UserDatabaseConnection.dart';

class DatabaseConnection {
  // Existing code for adding an event
  Future<void> addEvent(String eventId, String userId, String eventType,
      String eventName, String description, String url) async {
    final event = <String, String>{
      "eventId": eventId,
      "userId": userId,
      "eventType": eventType,
      "date": DateTime.now().toString(),
      "eventName": eventName,
      "description": description,
      "URL": url
    };
    var db = FirebaseFirestore.instance;
    try {
      await db.collection("events").doc(eventId).set(event);
    } catch (e) {
      print(e);
    }
  }

  // Method to delete an event
  Future<void> deleteEvent(String eventId) async {
    var db = FirebaseFirestore.instance;
    try {
      await db.collection("events").doc(eventId).delete();
      print("Event deleted successfully");
    } catch (e) {
      print(e);
    }
  }
}

//add event to user

  Future<void> addEventToUser(String email, String event) async {
    var db = FirebaseFirestore.instance;
    try {
      final docRef = db.collection("users").doc(email);

      await db.runTransaction((transaction) async {
        final snapshot = await transaction.get(docRef);
        if (!snapshot.exists) {
          throw Exception("User does not exist!");
        }

        final user = Users.fromFirestore(snapshot, null);
        final userEvents = List<String>.from(user.events ?? []);

        if (!userEvents.contains(event)) {
          userEvents.add(event);
          transaction.update(docRef, {"events": userEvents});
          print("Event added to user");
        } else {
          print("Event already exists for user");
        }
      });
    } catch (e) {
      print(e);
    }
  }
