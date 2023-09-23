import 'package:flutter/material.dart';
import 'package:flutter_learn/101/navigation_learn.dart';
import 'package:flutter_learn/product/mixin/navigator_mixin.dart';
import 'package:flutter_learn/product/navigator/navigater_routes.dart';
import 'package:flutter_learn/product/navigator/navigator_manager.dart';
class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> with NavigatorMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.abc_rounded),
        onPressed: () async {
          // navigator mixin classiyla daha da temiz kodu asagida router kullanarak yapabilirlm..
          router.pushToPage(NavigateRoutes.detail,arguments: 'hf10');
          // asagidaki gibi contextsiz navigator manager classiyla navigation yapabilirim..
          // context olmadigi icin sayfanin navigation'ina karisabiliyorum..
          // bazen history vs okumamiz gerekebiliyr key sayesinde buna erisebiliyorum..
          
          // !! await NavigatorManager2.instance.pushToPage(NavigateRoutes.detail,arguments: 'hf10');
         
         // Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf,
          // arguman araciligiyla data yollayabililrim:.
         // arguments: "abc"
         // );
        },
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}