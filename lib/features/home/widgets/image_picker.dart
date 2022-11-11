// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:major_proj_sbj/common/gradient_button.dart';

class MriImagePicker extends StatefulWidget {
  const MriImagePicker({
    Key? key,
  }) : super(key: key);

  @override
  _MriImagePickerState createState() => _MriImagePickerState();
}

class _MriImagePickerState extends State<MriImagePicker> {
  final ImagePicker _picker = ImagePicker();
  bool isImagePicked = false;
  XFile? _pickedImage = XFile('assets/images/Vector.png');
  void _pickImage() async {
    final XFile? pickedImageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 250,
    );
    setState(() {
      if (pickedImageFile != null) {
        isImagePicked = true;
        _pickedImage = pickedImageFile;
      } else {
        isImagePicked = false;
      }
    });
  }

  // @override
  // void initState() {
  //   _pickedImage = XFile('assets/images/Logo.png');
  //   super.initState();
  // }

//   File images = File('assets/images/Logo.png');
// void selectImages() async {
//     var res = await pickImages();
//     setState(() {
//       images = res;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: !isImagePicked
                          ? const AssetImage('assets/images/Logo.png')
                              as ImageProvider
                          : FileImage(File(_pickedImage!.path)),
                    ),
                  ), //change to network image later
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GradientButton(
                function: _pickImage,
                text: 'Select picture',
                buttonWidth: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              GradientButton(
                function: () {},
                text: 'Upload',
                buttonWidth: 200,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
