// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  ForgotPasswordScreen({Key? key}) : super(key: key);

  void dispose() {
    emailController.dispose();
    // super.dispose();
  }

  // var _userEmail = '';

  Future<void> resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Password Reset Link Sent."),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      Navigator.pop(context);
    } on PlatformException catch (error) {
      var message = 'An error occured.';
      if (error.message != null) {
        message = error.message as String;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color(0xff09051C),
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                height: 50,
                width: 225,
                child: Text(
                  'Enter your email to be used to reset your password',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff000000), height: 1.5),
                ),
              ),
              Container(
                height: 80,
                width: 350,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 201, 223, 223),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/sms.png',
                      height: 40.0,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Column(
                        children: [
                          // Text(
                          //   "Via email",
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //   ),
                          // ),
                          SizedBox(
                            height: 60,
                            width: 200,
                            child: TextFormField(
                              key: const ValueKey('email'),
                              controller: emailController,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 200),
              Center(
                child: GradientButton(
                  text: "Send Link",
                  buttonWidth: 300,
                  function: () {
                    resetPassword(context);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text("Password Reset Link Sent."),
                    //     backgroundColor: Theme.of(context).errorColor,
                    //   ),
                    // );
                    // Navigator.pop(context);
                  },
                  // () => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResetPasswordScreen(),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
