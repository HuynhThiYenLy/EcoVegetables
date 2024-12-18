import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFFF2F2F2);
  static const Color error = Color(0xFFB00020);
  static const Color fill = Color(0xFFF2F2F2);
  static const Color button = Color(0xFF00BB00);
  static const Color textButton = Color(0xFFFFFFFF);
  static const Color borderColor = Color.fromARGB(255, 0, 0, 0);
  static const Color hint = Color.fromARGB(255, 188, 188, 188);
  static const Color buttonText = Color(0xFF2273FF);
  static const Color transparentSnackbar = Colors.transparent;

  static const Color primary = Color(0xFFD9850C);
  static const Color secondary = Color(0xFFD60059);
  static const Color text = Colors.black;
  static const Color green = Color(0xFF007B08);
  static const Color grey = Colors.grey;

  // /// Theme sáng (Light Theme)
  // static ThemeData lightTheme() {
  //   return ThemeData(
  //     brightness: Brightness.light,
  //     scaffoldBackgroundColor: background,
  //     primaryColor: primary,
  //     cardColor: error,
  //     textTheme: const TextTheme(
  //       displayLarge: TextStyle(
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.bold,
  //         color: Colors.black,
  //       ),
  //       bodyLarge: TextStyle(
  //         fontSize: 16.0,
  //         color: Colors.black,
  //       ),
  //       bodyMedium: TextStyle(
  //         fontSize: 14.0,
  //         color: Colors.black,
  //       ),
  //     ),
  //     appBarTheme: const AppBarTheme(
  //       backgroundColor: primary,
  //       foregroundColor: Colors.white,
  //       elevation: 0,
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: button,
  //         foregroundColor: Colors.white,
  //       ),
  //     ),
  //     snackBarTheme: const SnackBarThemeData(
  //       backgroundColor: transparentSnackbar,
  //       contentTextStyle: TextStyle(color: Colors.grey),
  //     ),
  //     colorScheme: const ColorScheme.light(
  //       primary: primary,
  //       secondary: secondary,
  //       background: background,
  //       error: error,
  //     ),
  //   );
  // }

  // /// Theme tối (Dark Theme)
  // static ThemeData darkTheme() {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     scaffoldBackgroundColor: Colors.black,
  //     primaryColor: primary,
  //     cardColor: error,
  //     textTheme: const TextTheme(
  //       displayLarge: TextStyle(
  //         fontSize: 32.0,
  //         fontWeight: FontWeight.bold,
  //         color: Colors.white,
  //       ),
  //       bodyLarge: TextStyle(
  //         fontSize: 16.0,
  //         color: Colors.white,
  //       ),
  //       bodyMedium: TextStyle(
  //         fontSize: 14.0,
  //         color: Colors.white,
  //       ),
  //     ),
  //     appBarTheme: const AppBarTheme(
  //       backgroundColor: primary,
  //       foregroundColor: Colors.white,
  //       elevation: 0,
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: button,
  //         foregroundColor: Colors.white,
  //       ),
  //     ),
  //     snackBarTheme: const SnackBarThemeData(
  //       backgroundColor: transparentSnackbar,
  //       contentTextStyle: TextStyle(color: Colors.grey),
  //     ),
  //     colorScheme: const ColorScheme.dark(
  //       primary: primary,
  //       secondary: secondary,
  //       background: Colors.black,
  //       error: error,
  //     ),
  //   );
  // }
}
