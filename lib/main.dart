import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'modules/view/screen/Home_Screen/Views/home_screen.dart';
import 'modules/view/screen/Splash_Screen/Views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => Splash_Screen(),
        ),
        GetPage(
          name: '/homePage',
          page: () => Home_Screen(),
        ),
      ],
    ),
  );
}
