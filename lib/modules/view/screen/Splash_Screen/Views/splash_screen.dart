import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/global.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.offNamed("/homePage");
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.52,
              width: height * 0.52,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/splash.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Text(
              "Todo App",
              style: TextStyle(
                fontSize: height * 0.036,
                fontWeight: FontWeight.bold,
                color: const Color(0xff244049),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
