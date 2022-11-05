import 'package:flutter/material.dart';
import 'package:major_proj_sbj/constants/global_variables.dart';

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
          itemExtent: 82,
          itemCount: 4,
          itemBuilder: (context, i) {
            return Container(
              height: 90,
              width: 90,
              padding: const EdgeInsets.all(1),
              child: Card(
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
            );
          }),
    );
  }
}
