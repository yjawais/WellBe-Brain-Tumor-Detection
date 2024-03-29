// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:major_proj_sbj/auth/screens/auth_screen.dart';
import 'package:major_proj_sbj/common/bottom_bar.dart';
import 'package:major_proj_sbj/common/splash_screen.dart';
import 'package:flutter/services.dart';
//import 'package:major_proj_sbj/features/home/screens/home_screen.dart';
import 'package:major_proj_sbj/routes/router.dart';

import 'constants/global_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WellBe',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: GlobalVariables.primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal,) ,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (userSnapshot.hasData) {
            return const BottomBar();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
