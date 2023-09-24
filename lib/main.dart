import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/views/home/homeView.dart';
import 'package:taxi_app/views/onBoardView/onboard1.dart';
import 'package:taxi_app/views/onBoardView/onbooardscreens.dart';
import 'package:taxi_app/views/onBoardView/splash_screen.dart';
import 'package:taxi_app/views/signUpViews/signUpView.dart';
import 'package:taxi_app/views/signUpViews/userInfoView.dart';
import 'firebase_options.dart';
int ?initScreen ;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen"));
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 || initScreen == null ?SplashScreen.routeName:FirebaseAuth.instance.currentUser!=null?HomeScreen.routeName:SignUpView.routeName,
      //initialRoute: SignUpView.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        OnboardOne.routeName:(_)=>OnboardOne(),
        OnboardScreens.routeName:(_)=>OnboardScreens(),
        SignUpView.routeName:(_)=>SignUpView(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        //ContactInfo.routeName:(_)=>ContactInfo(),
        //OTPVer.routeName:(_)=>OTPVer(),
      },
    );
  }
}

