import 'package:ecovegetables_app/screens/authencation/mainTab_screen.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:ecovegetables_app/styles/app_size.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainTabScreen(),
        ),
      );
      print("***Splash: Chuyển màn hình thành công");
    });

    return Scaffold(
      backgroundColor: AppTheme.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              AppImage.logo,
              width: AppSize.sp500,
              height: AppSize.sp500,
            ),
          ],
        ),
      ),
    );
  }
}
