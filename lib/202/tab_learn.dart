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

// vsync sayfada tabcontroller'i kullnamamı sagliyoor.
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(0);
          }),
          bottomNavigationBar: BottomAppBar(
              notchMargin: 10,
              child: TabBar(
                  padding: EdgeInsets.zero,
                  // hangisine tiklandigini buradan gorebiliriz.
                  onTap: (int index) {
                    print(index);
                  },
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Page1',
                    ),
                    Tab(
                      text: 'Page2',
                    )
                  ])),
          appBar: AppBar(
            bottom: TabBar(controller: _tabController, tabs: const [
              Tab(
                text: 'Page1',
              ),
              Tab(
                text: 'Page 2',
              )
            ]),
          ),
          body: TabBarView(
              // gecisi engellemis olduk
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                const ImageLearn(),
                IconLearnView(),
              ]),
        ));
  }
}

// benim 4 sayfam olabilir..
enum _MyTabViews {
  home,
  setting,
  favorite,
  profile,
}
// peki text'leri vs bu yukaridaki sayfalara ozel nasil kullanacagim.
// bu durmda extensions yazarim. extension class'lara ya da bir insatance'a guc kazandirmaktir.

extension _MyTabViewExtension on _MyTabViews {
  void name(params) {}
}
