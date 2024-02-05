import 'package:flutter/material.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenHeight(context) {
    return getSize(context).height;
    //Get.height;
  }

  static double getScreenWidth(context) {
    return getSize(context).width;
  }

  static getHeight(double pixels, context) {
    double x = getScreenHeight(context) / pixels; // get the screen proportion
    return getScreenHeight(context) / x; // return height in prop to device
  }

  static getWidth(double pixels, context) {
    double x = getScreenWidth(context) / pixels; // get the screen proportion
    return getScreenWidth(context) / x; //
  }
}
