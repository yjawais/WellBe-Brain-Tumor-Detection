import 'package:flutter/material.dart';

//String uri='https://awais-amazon-clone.herokuapp.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
     Color(0xFFA4FFF7),
     Color(0xFFD0F7FF),
    ],
    stops: [0.5, 1.0],
  );
  static const primaryColor = Color(0xFF199A8E);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Color(0xFFE5FBF9);// Color(0xFFC9F6F2);//Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black54;

  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
  ];

  static const List<Map<String, String>> optionImages = [
    {
      'title': 'Doctor',
      'image': 'assets/images/Doctor.png',
    },
    {
      'title': 'Pharmacy',
      'image': 'assets/images/Pharmacy.png',
    },
    {
      'title': 'Hospital',
      'image': 'assets/images/Hospital.png',
    },
    {
      'title': 'Ambulance',
      'image': 'assets/images/Ambulance.png',
    },
   
  ];
}
