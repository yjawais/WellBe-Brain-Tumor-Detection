import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PharmacyService extends StatelessWidget {
static const  String routeName="/Pharmacy-service";
  const PharmacyService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pharmacy Service"),
      ),
     body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: WebView(
            initialUrl:'www.justdail.com/Nagpur/Doctors-For-Brain-Tumor',
          )
        ),
      ),
    );
  }
}