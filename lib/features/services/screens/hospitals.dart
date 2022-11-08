import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class HospitalsService extends StatelessWidget {
static const  String routeName="/Hospitals-service";
  const HospitalsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospitals"),
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