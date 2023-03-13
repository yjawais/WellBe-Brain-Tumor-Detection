import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';
import 'package:major_proj_sbj/features/services/screens/ambulance.dart';
import 'package:major_proj_sbj/features/services/screens/doctors.dart';
// import 'package:major_proj_sbj/features/services/screens/hospitals.dart';
import 'package:major_proj_sbj/features/services/screens/pharmacy.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 110,
          itemCount: 3,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                switch (i) {
                  case 0:
                    Navigator.of(context).pushNamed(DoctorService.routeName);
                    break;
                  case 1:
                    Navigator.of(context).pushNamed(PharmacyService.routeName);
                    break;
                  // case 2:
                  //   Navigator.of(context).pushNamed(HospitalsService.routeName);
                  //   break;
                  case 2:
                    Navigator.of(context).pushNamed(AmbulanceService.routeName);
                }
              },
              child: Container(
                height: 90,
                width: 90,
                padding: const EdgeInsets.all(1),
                child: Card(
                    color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              GlobalVariables.optionImages[i]['image']!,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        GlobalVariables.optionImages[i]['title']!,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
