import 'package:flutter/material.dart';
import 'package:major_proj_sbj/features/account/widgets/option_card.dart';
import 'package:major_proj_sbj/features/home/screens/brain_test_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
        //   backgroundColor: Colors.blueGrey,
        // actions: [
        //   Container(
        //     padding: const EdgeInsets.all(10),
        //     child: DropdownButton(
        //       underline: Container(),
        //       icon: const Icon(
        //         Icons.more_vert,
        //         color: Colors.white,
        //         size: 35,
        //       ),
        //       items: [
        //         DropdownMenuItem(
        //           value: 'logout',
        //           child: Row(
        //             children: [
        //               Icon(Icons.exit_to_app,
        //                   color: Theme.of(context).errorColor),
        //               const SizedBox(width: 8),
        //               const Text('Logout'),
        //             ],
        //           ),
        //         ),
        //       ],
        //       onChanged: (itemIdentifier) {
        //         if (itemIdentifier == 'logout') {
        //           FirebaseAuth.instance.signOut();
        //         }
        //       },
        //     ),
        //   ),
        // ],
        ),
        body: Container(
          padding:const EdgeInsets.all(16),
          child: OptionCard(
            buttonHeading: "Run Test",
            buttonSubHeading: "check for brain tumor",
            icon: Icons.bar_chart_rounded,
            function: () {
              Navigator.of(context).pushNamed(BrainTestScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
