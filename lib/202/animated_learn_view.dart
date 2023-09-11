import 'dart:isolate';

import 'package:flutter/material.dart';

final double kZero = 0;

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;
  late AnimationController controller;
  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _placeHolderWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisible();
        controller.animateTo(_isVisible ? 1 : 0);
      }),

      //body: _isVisible ? const Placeholder() : null,
      // animatedctrossfade iki widget/view  arasinda degisiklik yapmamizi saglar.
      //body: _placeHolderWidget(),
      body: Column(children: [
        ListTile(
          title: AnimatedOpacity(
              duration: _DurationItems.durationLow, opacity: _isOpacity ? 1 : 0, child: const Text('data')),
          trailing: IconButton(
            onPressed: () {
              _changeOpacity();
            },
            icon: const Icon(Icons.precision_manufacturing_rounded),
          ),
        ),
        AnimatedDefaultTextStyle(
            style:
                (_isVisible ? context.textTheme().displayLarge : context.textTheme().titleMedium) ?? const TextStyle(),
            duration: _DurationItems.durationLow,
            child: const Text('Gorkus')),
        AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
        // bu component kendi icinde butun senaryolarini animatik bir sekilde yaiyor.
        AnimatedContainer(
          duration: _DurationItems.durationLow,
          height: _isVisible ? kZero : (MediaQuery.of(context).size.width) * 0.2,
          width: (MediaQuery.of(context).size.height) * 0.2,
          color: Colors.blue,
          margin: const EdgeInsets.all(20),
        ),
        const Expanded(
            child: Stack(
          children: [
            AnimatedPositioned(
                top: 30, curve: Curves.elasticOut, duration: _DurationItems.durationLow, child: Text('data'))
          ],
        )),
        Expanded(
          child: AnimatedList(itemBuilder: (context, index, animation) {
            return const Text('data');
          }),
        )
      ]),
      //Text(
      // 'data',
      // // asagidaki extensionsla bi daha boyle yazmiyorum...
      // //style: Theme.of(context).textTheme.titleMedium,
      // style: context.textTheme().titleMedium,
      //),
    );
  }

  AnimatedCrossFade _placeHolderWidget() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationItems.durationLow);
  }
}

// bunu baska yerde kullanmak icin import edersem extension'lar gelir.
extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}
