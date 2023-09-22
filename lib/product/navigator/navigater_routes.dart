
import 'package:flutter_learn/303/lottie_learn.dart';
import 'package:flutter_learn/303/navigator/navigate_home_detail_view.dart';
import 'package:flutter_learn/303/navigator/navigate_home_view.dart';

class NavigatorRoutes{
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieLearn(),
        // 2. Bundan sonra gidecegim sayfayı veriyorum..
          NavigateRoutes.home.withParaf : (context) => const NavigateHomeView(),
          NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetailView()
  };
}

enum NavigateRoutes {
  init , home, detail
}

extension NavigateRoutesExtension on NavigateRoutes{
String get withParaf => "/$name";
}