
// bir sayfadan bir sayfaya giderken kullandigim logic'leri burada yapyorum. 
// Yani context'i kullanmadan yapiyorum.

import 'package:flutter/material.dart';
import 'package:flutter_learn/product/navigator/navigater_routes.dart';

class NavigatorManager2{
  NavigatorManager2._();
  static NavigatorManager2 instance = NavigatorManager2._();
  GlobalKey<NavigatorState> _navigatorGlobalKey  = GlobalKey();
GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

// Butun navigation'imi burada yapacagim..

Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
 await _navigatorGlobalKey.currentState?.pushNamed(route.withParaf,arguments: arguments);
}

}