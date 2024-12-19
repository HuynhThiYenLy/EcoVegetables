import 'package:ecovegetables_app/screens/authencation/login_screen.dart';
import 'package:ecovegetables_app/screens/authencation/mainTab_screen.dart';
import 'package:ecovegetables_app/screens/authencation/verifyOTP_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/screens/stack/splash_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifyOTPBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'EcoVegetables',
        home: MainTabScreen(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
