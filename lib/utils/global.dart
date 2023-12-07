import 'package:flutter/material.dart';
import 'package:get/get.dart';

double height = Get.height;
double width = Get.width;
DateTime initialDate = DateTime.now();

DateTime? date;
TimeOfDay initialTime = TimeOfDay.now();

TimeOfDay? time;
final GlobalKey<FormState> addInFormKey = GlobalKey<FormState>();
final TextEditingController todoController = TextEditingController();
