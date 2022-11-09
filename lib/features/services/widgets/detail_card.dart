// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/constants/hospital_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = HospitalData.hospitalData;
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: ((context, i) {
        return Card(
          child: Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Hospital.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[i]['hospital_name']!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        data[i]['hosp_address']!,
                        softWrap: true,
                      ),
                      Text("${data[i]['city']!} ${data[i]['state']!}"),
                      //Text(data[i]['state']!),
                      Text(data[i]['phone']!),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap:  () => launch('tel:${data[i]['phone']!.toString()}'),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      // border: Border.all(
                      //   color: GlobalVariables.primaryColor
                      // ),
                      image:  DecorationImage(
                        image: AssetImage("assets/images/call.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
