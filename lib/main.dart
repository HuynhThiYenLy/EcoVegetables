import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/MyApp.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: Locale('vi'),
      child: MyApp(),
    ),
  );
}
