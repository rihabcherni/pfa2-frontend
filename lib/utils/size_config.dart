import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  static late SizeConfig _instance;

  // Private constructor to prevent instantiation from outside
  SizeConfig._internal();

  // Getter to access the instance
  static SizeConfig getInstance() {
    return _instance;
  }

  // Initialize SizeConfig
  static void init(BuildContext context) {
    _instance = SizeConfig._internal();
    _instance._mediaQueryData = MediaQuery.of(context);
    _instance.screenWidth = _instance._mediaQueryData.size.width;
    _instance.screenHeight = _instance._mediaQueryData.size.height;
    _instance.blockSizeHorizontal = _instance.screenWidth / 100;
    _instance.blockSizeVertical = _instance.screenHeight / 100;
  }
}
