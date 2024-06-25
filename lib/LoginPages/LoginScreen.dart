//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/services/functions/authFunctions.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var phoneNumberController=TextEditingController();
  var signInOrSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Smart House",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                //Icon(Icons.smart_toy_outlined),
                SizedBox(
                  height: 16,
                ),
                signInOrSignUp
                    ?
                    ///****************** Sign In Part *****************
                    signInForm()
                    ///****************** Sign Up Part *****************
                    : signUpForm(),
              ],
            ),
          ),
        ),
      ),

    );

  }

  signUpForm() {
    return Container(
        child: Column(
      children: [
        Text('Sign Up', style: TextStyle(fontSize: 24)),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16), // set the border radius here
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
              ),

              /// Password
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter First Name';
                  } else {
                    return null;
                  }
                },
                controller: firstNameController,
                decoration: InputDecoration(
                    label: Text("First Name"),
                    hintText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
              ),

              /// First Name
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Last Name';
                  } else {
                    return null;
                  }
                },
                controller: lastNameController,
                decoration: InputDecoration(
                    label: Text("Last Name"),
                    hintText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
              ),

              /// Last Name
              SizedBox(height: 10),
              TextFormField(

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Phone Number';
                  } else {
                    return null;
                  }
                },
                controller: phoneNumberController,
                decoration: InputDecoration(
                    label: Text("Phone Number"),
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
              ),

              /// Phone Number
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var email = emailController.value.text;
                    var password = passwordController.value.text;
                    var firstName=firstNameController.value.text;
                    var lastName=lastNameController.value.text;
                    var phoneNumer=phoneNumberController.value.text;
                    AuthServices.signupUser(firstName, lastName, email, phoneNumer, password, context);
                  }
                },
                child: Text('Sign Up'),
              ),

              /// Button Sign Up
              SizedBox(height: 20),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account ?'),
                  TextButton(
                    child: Text("Sign In"),
                    onPressed: () {
                      setState(() {
                        signInOrSignUp = true;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ],
    ));
  }


  signInForm() {
    return Container(
        child: Column(
      children: [
        Text('Sign In', style: TextStyle(fontSize: 24)),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(16), // set the border radius here
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          16), // set the border radius here
                    )),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var email = emailController.value.text;
                    var password = passwordController.value.text;
                    AuthServices.signinUser(email, password, context);
                  }
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to the forgot password screen
                },
                child: Text('Forgot Password?'),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need an account ?'),
                  TextButton(
                    child: Text("Sign Up"),
                    onPressed: () {
                      setState(() {
                        signInOrSignUp = false;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 400,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
