import 'package:flutter/material.dart';
import 'package:major_proj_sbj/features/home/widgets/image_picker.dart';

class BrainTestScreen extends StatelessWidget {
  static const routeName="/brain-test" ;
  const BrainTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: MriImagePicker(),
    );
  }
}