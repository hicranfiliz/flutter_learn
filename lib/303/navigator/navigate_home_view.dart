import 'package:flutter/material.dart';
import 'package:flutter_learn/product/navigator/navigater_routes.dart';
class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({super.key});

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.abc_rounded),
        onPressed: (){
          Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf,
          // arguman araciligiyla data yollayabililrim:.
          arguments: "abc"
          );
        },
      ),
      appBar: AppBar(
        title: Text(toString()),
      ),
    );
  }
}