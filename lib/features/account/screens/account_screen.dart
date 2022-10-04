// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:major_proj_sbj/constants/global_variables.dart' as constants;
import 'package:major_proj_sbj/features/account/widgets/option_card.dart';
//import 'package:line_icons/line_icons.dart';

import 'package:major_proj_sbj/models/user_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  Future getUserData() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) => loggedInUser = UserModel.fromMap(value.data()));
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: constants.backgroundColor,
          body:
              // FutureBuilder(
              //     future: getUserData(),
              //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //       if (snapshot.hasData) {
              //        return
              ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Profile",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black45)),
          SizedBox(height: 20),
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
                // boxShadow: [
                //   BoxShadow(
                //       color: Color(0xff27272c).withOpacity(0.56),
                //       offset: Offset(2, 2),
                //       blurRadius: 2),
                //   BoxShadow(
                //       color: Color(0xff040404).withOpacity(0.64),
                //       offset: Offset(-2, -2),
                //       blurRadius: 2),
                //   BoxShadow(
                //       color: Color(0xff040404).withOpacity(0.8),
                //       offset: Offset(8, 8),
                //       blurRadius: 16),
                //   BoxShadow(
                //       color: Color(0xff27272C).withOpacity(0.48),
                //       offset: Offset(-8, -8),
                //       blurRadius: 12),
                // ],
                ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // ProfilePicture(
                //     name: loggedInUser.childName!,
                //     radius: 35,
                //     fontsize: 45),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loggedInUser.username.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      loggedInUser.phone.toString(),
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54.withOpacity(0.6)),
                    ),
                    // Text(
                    //   "Current funds 98,099 points",
                    //   style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.green,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          
          OptionCard(
              buttonHeading: "Account Settings",
              buttonSubHeading: "Update user data",
              icon: Icons.account_circle_rounded),
          SizedBox(height: 10),
          OptionCard(
              buttonHeading: "System Settings",
              buttonSubHeading: "Accessibility settings",
              icon: Icons.settings),
          SizedBox(height: 10),
          OptionCard(
              buttonHeading: "Contact",
              buttonSubHeading: "contact settings",
              icon: Icons.mail),
          SizedBox(height: 10),
          OptionCard(
              buttonHeading: "Logout",
              buttonSubHeading: " ",
              icon: Icons.logout_rounded),
        ],
      )
          // } else if (snapshot.hasError) {
          //   print(snapshot.error);
          // }
          // return Center(child: CircularProgressIndicator());

          // }
          ),
    );
  }
}
