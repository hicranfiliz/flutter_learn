

import 'package:flutter/material.dart';

enum LottieItems{
  themeChange
}

extension LottieItemsExtension on LottieItems{
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
      return 'lottie_theme_change';
        
    }
  }

  // computed property olarak tanimladim..
  String get lottiePath =>'assets/lottie/${_path()}.json';
}