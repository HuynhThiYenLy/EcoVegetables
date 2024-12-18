import 'package:ecovegetables_app/screens/authencation/mainTab_screen.dart';
import 'package:ecovegetables_app/screens/authencation/verifyOTP_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/screens/stack/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoVegetables',
      home: SplashScreen(),
      // home: VerifyOTPScreen(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
