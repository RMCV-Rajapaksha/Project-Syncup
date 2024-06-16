import 'package:cloud_firestore/cloud_firestore.dart';

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
