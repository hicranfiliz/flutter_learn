import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('colors'),
      ),
      body: Container(
        color: ColorsItems.turquaz_blue,
        child: const Text('hello'),
      ),
    );
  }
}

class ColorsItems {
  static const Color porche = Color(0xffEDBB61);

  static const Color turquaz_blue = Color(0xff61EDA2);
}
