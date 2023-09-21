import 'package:flutter/material.dart';
import 'package:flutter_learn/101/page_view_learn.dart';
import 'package:flutter_learn/product/constant/duration_items.dart';
import 'package:flutter_learn/product/constant/lottie_items.dart';
import 'package:flutter_learn/product/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

//https://lottie.host/499a112f-0123-418a-a58b-8c459ea7c6d0/xtDggvZO0g.json
//https://lottie.host/b69d1112-1237-4910-a775-75e63080285b/Aa57NPk76b.json
class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin{
late AnimationController controller;
bool isLight = false;

@override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: DurationItems.durationNormal());
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // theme'yi lottie'nin ozelliklerini kullanarak button gibi yapalim..
          InkWell(
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              //controller.animateTo(0.5);
              //
              isLight = !isLight;
              // bu islem bittikten sonra controller'i ata.
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
          repeat: false,
          controller: controller
          ))
        ],
      ),
      // eger lottie bir component olacaksa yani birden fazla sayfada kullanilacaksa widget'a cikar tekrar tekrar yazma!
      body: const LoadingLottie(),

    );
  }
}

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
 final _loadingLottie = 'https://lottie.host/499a112f-0123-418a-a58b-8c459ea7c6d0/xtDggvZO0g.json';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
        Lottie.network(_loadingLottie),
        
      
    );
  }
}