import 'package:flutter/material.dart';
import 'package:whatsappclone/Styles/theme.dart';
import 'package:whatsappclone/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // This builder gives access to context before MaterialApp is built

        // Use WidgetsBinding to get platform brightness
        final Brightness platformBrightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;

        final bool isDarkMode = platformBrightness == Brightness.dark;
        return MaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme(context),
          home: SplashScreen(),
          darkTheme: darkTheme(context),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
