import 'package:flutter/material.dart';
import 'package:major_proj_sbj/features/services/widgets/detail_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DoctorService extends StatelessWidget {
  static const String routeName = "/Doctor-service";
  const DoctorService({Key? key}) : super(key: key);

  // void getDoctors() async {
  //   Uri url = Uri.parse(
  //       'www.justdail.com/Nagpur/Doctors-For-Brain-Tumor');
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url, mode: LaunchMode.inAppWebView);
  //   } else {
  //     throw "cannot launch $url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
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
