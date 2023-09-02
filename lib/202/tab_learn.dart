import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedvalue = 10;

// vsync sayfada tabcontroller'i kullnamamı sagliyoor.
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          bottomNavigationBar: BottomAppBar(notchMargin: _notchedvalue, child: _myTabView()),
          appBar: AppBar(),
          body: _tabbarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        // hangisine tiklandigini buradan gorebiliriz.
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(
        // gecisi engellemis olduk
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          const ImageLearn(),
          IconLearnView(),
          const ImageLearn(),
          IconLearnView(),
        ]);
  }
}

// benim 4 sayfam olabilir..
enum _MyTabViews { home, setting, favorite, profile }
// peki text'leri vs bu yukaridaki sayfalara ozel nasil kullanacagim.
// bu durmda extensions yazarim. extension class'lara ya da bir insatance'a guc kazandirmaktir.

extension _MyTabViewExtension on _MyTabViews {}
