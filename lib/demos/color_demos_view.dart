// bir ekran 3 bıutton, buttonlara basilinca renk degisiim,
// basili button selected icon olsun.

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({super.key});

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;

  void changeBackgroundColor(Color color) {
    // ekrranin tekrardan tetiklenmesini istiyorsak setstate yazariz.
    setState(() {
      _backgroundColor = color;
    });
  }

// build icinde cok fazla etod birakma, disari cikart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          // ontap ile hangisine tklandigini alabiliyorum..
          onTap: _colorOnTap,
          items: const [
            BottomNavigationBarItem(
                icon: _ColorContainer(
                  color: Colors.red,
                ),
                label: 'Red'),
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow), label: 'Yellow'),
            BottomNavigationBarItem(icon: _ColorContainer(color: Colors.green), label: 'Green'),
          ]),
    );
  }

  void _colorOnTap(value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.green.index) {
      changeBackgroundColor(Colors.green);
    }
  }
}

enum _MyColors { red, yellow, green }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
