import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/services/widgets/detail_card.dart';

class HospitalsService extends StatelessWidget {
  static const String routeName = "/Hospitals-service";
  const HospitalsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: Image.asset("assets/images/Vector.png"),
        ),
        title: const Text(
          "Hospitals",
          softWrap: true,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(5),
          child:const DetailCard(),
        ),
      ),
    );
  }
}
