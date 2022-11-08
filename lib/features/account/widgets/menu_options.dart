import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({Key? key}) : super(key: key);

  static const List<String> menuImages = [
    'assets/images/Profile.png',
    'assets/images/Heart.png',
    'assets/images/Document.png',
    'assets/images/Chat.png',
    'assets/images/Danger Circle.png',
  ];

  static const List<String> menuTitle = [
    'Update Profile',
    'Saved Results',
    'Appointments',
    'FAQ',
    'Log Out',
  ];

  void popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            // title: const Text(" "),
            children: [
              SizedBox(
                height: 325,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 40,
                        child: Icon(
                          Icons.logout_rounded,
                          size: 55,
                          color: GlobalVariables.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Log Out?',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GradientButton(
                        text: "Log Out",
                        function: () {
                          FirebaseAuth.instance.signOut();
                        },
                        buttonWidth: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        height: 50.0,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: GlobalVariables.primaryColor,
                              padding: const EdgeInsets.all(0.0),
                              side: const BorderSide(
                                color: GlobalVariables.primaryColor,
                              )),
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemExtent: 65,
        itemCount: 5,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              switch (i) {
                case 0:
                  return null;
                case 1:
                  return null;
                case 2:
                  return null;
                case 3:
                  return null;
                case 4:
                  popupDialog(context);
              }
            },
            child: Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          menuImages[i],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      menuTitle[i],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
