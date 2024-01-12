import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:smart_home_flutter_ui/LoginScreen.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/firebase_options.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  print("good here");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("good here also");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart House',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColor.bgColor,
          fontFamily: "Poppins"),
      home: Center(),
    );
  }

 /* void setData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference =
        firestore.collection('users').doc("lNDFYyG97pxZqot4TnI4");

    try {
      await documentReference.set({
        'field1': 'value1',
        'field2': 'value2',
        // Add other fields as needed
      });
      print('Document successfully set.');
    } catch (e) {
      print('Error setting document: $e');
    }
  }*/
}
