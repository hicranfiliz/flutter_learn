
import 'package:flutter/material.dart';
import 'package:flutter_learn/303/lottie_learn.dart';
import 'package:flutter_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_learn/303/navigator/navigate_home_view.dart';
import 'package:flutter_learn/main.dart';
import 'package:flutter_learn/product/navigator/navigater_routes.dart';

// bu navgator custom class'i sadece widget'lar tarafindan kullanilacak: hatta sadece myapp tarafindan.so:
mixin NavigatorCustom<T extends MyApp> on Widget{
  Route<dynamic>?  onGenerateRoute(RouteSettings routeSettings) {
    if(routeSettings.name?.isEmpty ?? true){
     return _navigateToNormal(const LottieLearn());
    }

    // if ,cindeki stringleri enum'a cevirip kullanma:
    // basindaki rootlari siliyorum ("/")
    final _routes = routeSettings.name == NavigatorRoutes.paragfh 
    ? NavigateRoutes.init 
    : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (_routes) {

      case NavigateRoutes.init:
                 return _navigateToNormal(const LottieLearn());

      case NavigateRoutes.home:
      return _navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.detail:
      final _id = routeSettings.arguments;
      // ornegin homedetail acilirken fullscreenDialog'u true'ya cekmek istiyoruz..
             return _navigateToNormal(
               NavigateHomeDetailView(
              id: _id is String ? _id : null ,
              ),
              isFullScreenDialog: true
              );
    }
  }

// custom navigation'imi bu sekilde yapabilirim.
  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
     return MaterialPageRoute(
      fullscreenDialog: isFullScreenDialog ?? false,
      builder: (context){
              return  child;
  });
  }
}