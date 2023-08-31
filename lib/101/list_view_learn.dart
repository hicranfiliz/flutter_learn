import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

// listviewde normalde dikey olarak hareket eder ve height sonsuzdur. o yuzden ayarlarken width'ini ayarlamamamız lazım.
// istersek listview'in direction'ini  yatay yapabilirliz. Bu duurmda içindeki componnetlerin height'ini belirtmemiz lazim,
// bunun için de sizedbox'a sarmamiz lazim..

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // hic style vermesek bile oldugu yere sigsin istiyorsam fittedbox kulan
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
              // ekrana sigmasi icin
              //textScaleFactor: 0.9,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          // xxx
          FittedBox(
            child: Text(
              'Merhaba',
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
              // ekrana sigmasi icin
              //textScaleFactor: 0.9,
            ),
          ),
          Container(
            color: Colors.red,
            height: 300,
          ),
          const Divider(),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
                Container(
                  color: Colors.white,
                  width: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
          _ListDemo(),
        ],
      ),
    );
  }
}

class _ListDemo extends StatefulWidget {
  const _ListDemo({super.key});

  @override
  State<_ListDemo> createState() => __ListDemoState();
}

class __ListDemoState extends State<_ListDemo> {
// initstate wşdget harekete gectiginde tetiklenir .
  @override
  void initState() {
    super.initState();
    print('hello');
  }

  @override
  void dispose() {
    super.dispose();
    print('exit');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
