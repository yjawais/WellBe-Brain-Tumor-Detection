import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AmbulanceService extends StatelessWidget {
  static const String routeName = "/ambulance-service";
  const AmbulanceService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Ambulance Service"),
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(5),
            child: const WebView(
              initialUrl: ' https://www.sulekha.com/ambulance-services/nagpur',
            )),
      ),
    );
  }
}
