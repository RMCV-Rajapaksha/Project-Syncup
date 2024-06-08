import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? email; // email is used as the document id
  final String? firstName;
  final String? lastName;
  final String? profileURL;
  final List<String>? events;

  Users({
    this.email,
    this.firstName,
    this.lastName,
    this.profileURL,
    this.events,
  });

  factory Users.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Users(
      email: data?['email'],
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      profileURL: data?['profileURL'],
      events: data?['events'] is Iterable
          ? List<String>.from(data?['events'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null) "email": email,
      if (firstName != null) "firstName": firstName,
      if (lastName != null) "lastName": lastName,
      if (profileURL != null) "profileURL": profileURL,
      if (events != null) "events": events,
    };
  }

// create user data
  Future<void> addUserData(
      String firstName, String lastName, String email, String url) async {
    var db = FirebaseFirestore.instance;
    try {
      final user = Users(
        email: email,
        firstName: firstName,
        lastName: lastName,
        profileURL: url,
        events: [],
      );

      final docRef = db
          .collection("users")
          .withConverter(
            fromFirestore: Users.fromFirestore,
            toFirestore: (Users user, options) => user.toFirestore(),
          )
          .doc(email);

      await docRef.set(user);
      print("User added");
    } catch (e) {
      print(e);
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
        final updatedEvents = List<String>.from(user.events ?? [])..add(event);

        transaction.update(docRef, {"events": updatedEvents});
      });

      print("Event added to user");
    } catch (e) {
      print(e);
    }
  }

//delete event from user
  Future<void> deleteEventFromUser(String email, String event) async {
    var db = FirebaseFirestore.instance;
    try {
      final docRef = db.collection("users").doc(email);

      await db.runTransaction((transaction) async {
        final snapshot = await transaction.get(docRef);
        if (!snapshot.exists) {
          throw Exception("User does not exist!");
        }

        final user = Users.fromFirestore(snapshot, null);
        final updatedEvents = List<String>.from(user.events ?? [])
          ..remove(event);

        transaction.update(docRef, {"events": updatedEvents});
      });

      print("Event deleted from user");
    } catch (e) {
      print(e);
    }
  }
}
