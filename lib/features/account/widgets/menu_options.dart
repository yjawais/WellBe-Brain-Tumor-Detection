import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                case 0: return null;
                case 1: return null;
                case 2: return null;
                case 3: return null;
                case 4: FirebaseAuth.instance.signOut();
  
               
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
