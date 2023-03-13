
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/home/widgets/image_picker.dart';
import 'package:major_proj_sbj/features/home/widgets/picker_image_app.dart';

class BrainTestScreen extends StatelessWidget {
  static const routeName = "/brain-test";
  const BrainTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          title: const Text(
            "Run Test",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 1.5,
        ),
        body: const MriImagePickerFromApp (),
      ),
    );
  }
}
