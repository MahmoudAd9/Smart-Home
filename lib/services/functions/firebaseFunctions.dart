import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  static saveUser(firstName, lastName, email, phoneNumber, uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber
    });
  }

}
