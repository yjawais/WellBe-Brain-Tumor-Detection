import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PharmacyService extends StatefulWidget {
  static const String routeName = "/Pharmacy-service";
  const PharmacyService({Key? key}) : super(key: key);

  @override
  State<PharmacyService> createState() => _PharmacyServiceState();
}

class _PharmacyServiceState extends State<PharmacyService> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Pharmacy Service"),
      ),
      body: SafeArea(
        child: Container(
          color: GlobalVariables.backgroundColor,
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              WebView(
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
                initialUrl:
                    'https://www.medicineindia.org/pharmacies-chemists-drugstores-in-city/600/nagpur',
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
