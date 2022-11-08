import 'package:flutter/material.dart';
import 'package:major_proj_sbj/auth/screens/auth_screen.dart';
import 'package:major_proj_sbj/auth/screens/profile_input_screen.dart';
import 'package:major_proj_sbj/common/bottom_bar.dart';
import 'package:major_proj_sbj/features/home/screens/brain_test_screen.dart';
import 'package:major_proj_sbj/features/home/screens/home_screen.dart';
import 'package:major_proj_sbj/features/services/screens/ambulance.dart';
import 'package:major_proj_sbj/features/services/screens/doctors.dart';
import 'package:major_proj_sbj/features/services/screens/hospitals.dart';
import 'package:major_proj_sbj/features/services/screens/pharmacy.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    case ProfileInputScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileInputScreen(),
      );
    case BrainTestScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const BrainTestScreen(),
      );
    case DoctorService.routeName:
      return MaterialPageRoute(
        builder: (_) => const DoctorService(),
      );
    case PharmacyService.routeName:
      return MaterialPageRoute(
        builder: (_) => const PharmacyService(),
      );
    case AmbulanceService.routeName:
      return MaterialPageRoute(
        builder: (_) => const AmbulanceService(),
      );
    case HospitalsService.routeName:
      return MaterialPageRoute(
        builder: (_) => const HospitalsService(),
      );
    // case AddProductScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const AddProductScreen(),
    //   );
    // case CategoryDealsScreen.routeName:
    //   var category = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => CategoryDealsScreen(
    //       category: category,
    //     ),
    //   );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    // case ProductDetailScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailScreen(
    //       product: product,
    //     ),
    //   );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     builder: (_) => AddressScreen(
    //       totalAmount: totalAmount,
    //     ),
    //   );
    //    case OrderDetailScreen.routeName:
    //   var order = routeSettings.arguments as Order;
    //   return MaterialPageRoute(
    //     builder: (_) => OrderDetailScreen(
    //       order: order,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page not found!"),
          ),
        ),
      );
  }
}
