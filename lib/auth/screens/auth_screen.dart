// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:major_proj_sbj/auth/screens/profile_input_screen.dart';
import 'package:major_proj_sbj/auth/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .whenComplete(() =>
                Navigator.of(ctx).pushNamed(ProfileInputScreen.routeName));

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .update({
          'email': email,
        });
      }
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
