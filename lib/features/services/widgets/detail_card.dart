import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            const SizedBox(width: 20,),
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
            const SizedBox(width: 20,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name"),
                  Text("Phone number"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
