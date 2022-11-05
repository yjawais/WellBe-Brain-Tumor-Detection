// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/account/widgets/menu_options.dart';
import 'package:major_proj_sbj/features/account/widgets/profile_details_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment(0.0,-1),
          //   end: Alignment(0.0, 1),
          //   colors: [
          //      Color(0xFF30ADA2),
          //     Color(0xFF52D1C6),

          //   ],
          //   stops: [0.5,1.0],
          // ),
          image: DecorationImage(
            image: AssetImage('assets/images/36_Profile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 275,
                  padding: const EdgeInsets.symmetric(vertical: 25,),
                  child: ProfileDetails(),
                ),
                SizedBox(height:350,child: MenuOption()),
              
                //  OptionCard(
                //       buttonHeading: "Logout",
                //       buttonSubHeading: " ",
                //       icon: Icons.logout_rounded,
                //       function: () {
                //         FirebaseAuth.instance.signOut();
                //       },
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
