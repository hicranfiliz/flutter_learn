import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

// pageview icerisindeki widget'lari cizen.
// swipeable bir component.
// farkli containerlar ya da daha onceki olusturdugumuz farkli sayfalari verebiliriz.
// image array olustururken kulllanilir.
class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 1;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              // duration: sure
              _pageController.previousPage(duration: DurationUtility._durationLow, curve: Curves.slowMiddle);
            },
            child: const Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: DurationUtility._durationLow, curve: Curves.slowMiddle);
            },
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

// duration'lari tek bir yerde topla!
class DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
