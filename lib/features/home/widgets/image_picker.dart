// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';

class MriImagePicker extends StatefulWidget {
  const MriImagePicker({Key? key}) : super(key: key);

//  final void Function(XFile? pickedImage) imagePickedFn;
  // MriImagePicker(this.imagePickedFn);
  @override
  _MriImagePickerState createState() => _MriImagePickerState();
}

class _MriImagePickerState extends State<MriImagePicker> {
   File _pickedImage=File('assets/images/Logo.png');
  void _pickImage() async {
    final pickedImageFile = (await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    ));
    setState(() {
      _pickedImage = File(pickedImageFile!.path);
    });
    //  widget.imagePickedFn(pickedImageFile);
  }

  @override
  // void initState() {
  //   _pickedImage = File('assets/images/Vector.png');
  //   super.initState();
  // }

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
                padding: const EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: 
                         FileImage(_pickedImage)
                        // : const AssetImage('assets/images/Vector.png')
                        //     as ImageProvider,
                  ),
                ), //change to network image later
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
                function: (){},
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
