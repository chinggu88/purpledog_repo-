import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purpledog_repo/binding/binding.dart';
import 'package:purpledog_repo/view/home.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/home",
    initialBinding: Init(),
    getPages: [
      GetPage(name: "/home", page: () => Home()),
    ],
  ));
}
