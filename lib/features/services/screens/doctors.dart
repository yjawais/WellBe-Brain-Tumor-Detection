import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';

import 'package:webview_flutter/webview_flutter.dart';

class DoctorService extends StatefulWidget {
  static const String routeName = "/Doctor-service";
  const DoctorService({Key? key}) : super(key: key);

  @override
  State<DoctorService> createState() => _DoctorServiceState();
}

class _DoctorServiceState extends State<DoctorService> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Doctors"),
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
                  //  onProgress: (_){ CircularProgressIndicator() ;},
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl:
                      'https://www.practo.com/nagpur/surgeons-for-brain-tumor-surgery',
                ),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(),
              ],
            ),),
      ),
    );
  }
}
