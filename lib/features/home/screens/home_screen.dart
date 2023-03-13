import 'package:flutter/material.dart';
import 'package:major_proj_sbj/common/gradient_button.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/home/screens/brain_test_screen.dart';
import 'package:major_proj_sbj/features/home/widgets/option_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/Vector.png"),
          ),
          title: const Text(
            "WellBe",
            softWrap: true,
            style: TextStyle(
              fontSize: 26,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black12,
                  height: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Run a test:",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    color: Colors.white,
                    elevation: 1.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.centerRight,
                              scale: 0.5,
                              opacity: 0.2,
                              image: AssetImage(
                                'assets/images/Vector.png',
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(BrainTestScreen.routeName);
                          },
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Brain Tumor Detection Test",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                  softWrap: true,
                                ),
                                Text(
                                  "Running a brain tumor detection test for a faster analysis of MRI Images",
                                  style: TextStyle(
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.black12,
                  height: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Services:",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                const OptionTile(),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.white,
                    elevation: 1.5,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.centerRight,
                              scale: 0.5,
                              opacity: 0.2,
                              image: AssetImage(
                                'assets/images/Vector.png',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 300,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: const Text(
                                "Know more about your brain health",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: GradientButton(
                                  text: "Learn More",
                                  function: () async {
                                    Uri url = Uri.parse(
                                        'https://cancer.org/cancer/brain-spinal-cord-tumors-adults/detection-diagnosis-staging.html');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url,
                                          mode: LaunchMode.inAppWebView);
                                    } else {
                                      throw "cannot launch $url";
                                    }
                                  },
                                  buttonWidth: 130),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
