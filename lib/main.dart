import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whatsappclone/Styles/theme.dart';
import 'package:whatsappclone/auth/Controller/authController.dart';
import 'package:whatsappclone/auth/Repository/authRepository.dart';
import 'package:whatsappclone/auth/View/splash_screen.dart';
import 'package:whatsappclone/home/controller/homeController.dart';

import 'firebase_options.dart';

Future<void> init() async {
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((app) {
    GetStorage box = GetStorage("Authbox");
    Get.lazyPut(
      () => Authcontroller(authrepository: Authrepository(), box: box),
      fenix: true,
    );
    Get.lazyPut(() => Homecontroller(), fenix: true);

    runApp(const MyApp());
  });

  // Get.lazyPut(() => ChatController(chatRepo: Chatrepository()), fenix: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: lightTheme(context),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          darkTheme: darkTheme(context),
        );
      },
    );
  }
}
