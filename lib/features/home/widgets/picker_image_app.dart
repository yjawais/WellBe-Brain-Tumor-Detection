// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:major_proj_sbj/common/gradient_button.dart';
import 'package:major_proj_sbj/constants/image_data.dart';

class MriImagePickerFromApp extends StatefulWidget {
  const MriImagePickerFromApp({
    Key? key,
  }) : super(key: key);

  @override
  _MriImagePickerFromAppState createState() => _MriImagePickerFromAppState();
}

class _MriImagePickerFromAppState extends State<MriImagePickerFromApp> {
  String? imagename;
  String? result;
  String? imageresult;

  void getResult() {
    Timer(const Duration(seconds: 5), () {
      showDialog(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 550,
              width: 400,
              child: SimpleDialog(
                backgroundColor: Colors.white,
                children: [
                  SizedBox(
                    height: 550,
                    width: 400,
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          width: 350,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imageresult as String)),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 250,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            result.toString(),
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GradientButton(
                            text: 'Close',
                            function: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            buttonWidth: 150)
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    });
  }

  void pickImage() {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 400,
            width: 350,
            child: SimpleDialog(
               backgroundColor: Colors.white,
              children: [
              SizedBox(
                height: 450,
                width: 350,
                child: ListView.builder(
                    itemCount: ImageData.imageData.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            imagename = ImageData.imageData[i]['image_name'];
                            result = ImageData.imageData[i]['result'];
                            imageresult =
                                ImageData.imageData[i]['image_result'];
                          });
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImageData.imageData[i]
                                  ['image_name'] as String),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ]),
          );
        });
  }

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
                      image: imagename != null
                          ? AssetImage(imagename as String)
                          : const AssetImage('assets/images/Logo.png'),
                    ),
                  ), //change to network image later
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GradientButton(
                function: pickImage,
                text: 'Select picture',
                buttonWidth: 200,
              ),
              const SizedBox(
                height: 25,
              ),
              GradientButton(
                function: getResult,
                text: 'Get Results',
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
