// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String buttonHeading;
  final String buttonSubHeading;
  final IconData icon;
  final VoidCallback function;
  const OptionCard({
    Key? key,
    required this.buttonHeading,
    required this.buttonSubHeading,
    required this.icon,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
          // boxShadow: [
          //   BoxShadow(
          //       color: const Color(0xff27272c).withOpacity(0.56),
          //       offset: const Offset(2, 2),
          //       blurRadius: 2),
          //   BoxShadow(
          //       color: const Color(0xff040404).withOpacity(0.64),
          //       offset: const Offset(-2, -2),
          //       blurRadius: 2),
          //   BoxShadow(
          //       color: const Color(0xff040404).withOpacity(0.8),
          //       offset: const Offset(8, 8),
          //       blurRadius: 16),
          //   BoxShadow(
          //       color: const Color(0xff27272C).withOpacity(0.48),
          //       offset: const Offset(-8, -8),
          //       blurRadius: 12),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  buttonHeading,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                Text(buttonSubHeading,
                    style: TextStyle(
                        color: Colors.black26.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Icon(
              icon,
              color: Colors.black45,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
