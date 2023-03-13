// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/account/widgets/update_profile_form.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String routeName = '/update-profile';
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  var _isLoading = false;
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

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'username': username,
        'phone': phone,
        'userType': userType,
      }).then((_) => Navigator.of(ctx).pop());

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content:const Text('Data updated'),
        // ignore: use_build_context_synchronously
        backgroundColor: Theme.of(ctx).hintColor,
      ));
    }
    //on PlatformException
    catch (error) {
      var message = 'An error occured.';
      // if (error.message != null) {
      //   message = error.message!;
      // }
      message = error.toString();

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: GlobalVariables.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Update Profile",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              UpdateProfileForm(_submitProfileForm, _isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
