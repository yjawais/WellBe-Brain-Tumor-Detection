import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback function;

  final String text;
  final double buttonWidth;
  const GradientButton(
      {Key? key,
      required this.text,
      required this.function,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape:const StadiumBorder(),
          backgroundColor: GlobalVariables.primaryColor,
        //  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          padding: const EdgeInsets.all(0.0),
        ),
        // child: Ink(
        //   decoration: BoxDecoration(
        //       gradient: const LinearGradient(
        //         colors: [
        //           Color(0xff54C0BC),
        //           Color(0xff1fc585),
        //         ],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //       ),
        //       borderRadius: BorderRadius.circular(30.0),),
          child: Container(
            constraints: BoxConstraints(maxWidth: buttonWidth, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
     // ),
    );
  }
}
