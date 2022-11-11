import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/home/widgets/image_picker.dart';

class BrainTestScreen extends StatelessWidget {
  static const routeName = "/brain-test";
  const BrainTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    XFile? _userImage;

    void _pickedImage(XFile? image) {
      _userImage = image;
    }

    return Scaffold(
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
      body: MriImagePicker(),
    );
  }
}
