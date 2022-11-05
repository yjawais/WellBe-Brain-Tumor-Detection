// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:major_proj_sbj/auth/widgets/profile_form.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';

class ProfileInputScreen extends StatefulWidget {
  static const String routeName = '/profile-input';
  const ProfileInputScreen({Key? key}) : super(key: key);

  @override
  _ProfileInputScreenState createState() => _ProfileInputScreenState();
}

class _ProfileInputScreenState extends State<ProfileInputScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  var _isLoading = false;
  static var isProfileComplete = false;
  void _submitProfileForm(
    String username,
    String phone,
    String userType,
    BuildContext ctx,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      setState(() {
        isProfileComplete = true;
      });
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'phone': phone,
        'userType': userType,
        'isProfileComplete': isProfileComplete,
      }).then((_) => Navigator.of(ctx).pop()
          // pushNamedAndRemoveUntil(
          //     '/actual-home', (Route<dynamic> route) => false)
          );
    } on PlatformException catch (error) {
      var message = 'An error occured.';
      if (error.message != null) {
        message = error.message!;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
        isProfileComplete = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
             const SizedBox(height: 100,),
              const Text(
                "Complete Profile",
                textAlign: TextAlign.start,
                style: TextStyle(
                  
                  color: Colors.black45,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 50,),
              ProfileForm(_submitProfileForm, _isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
