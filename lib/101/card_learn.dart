import 'package:flutter/material.dart';

// card'in onemi ekranda bir tik onde durur.
// one cikarma icin -> elevation kullan.

class CardLearn extends StatelessWidget {
  const CardLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MADE WITH LOVE'),
      ),
      body: Column(
        children: [
          Card(
            //card icinde hali ahzirda margin bulundurur.
            // padding -> icten kisitlar
            // margin -> distan kisaltir.
            margin: ProjectMargins.cardMargin,
            //color: Colors.white,
            //shape: StadiumBorder(),
            //shape: CircleBorder(),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

            color: Colors.white,
            child: const SizedBox(
              height: 100,
              width: 150,
              child: Center(
                child: Text(
                  'Hicran',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 40,
            ),
          ),
          Card(
            //card icinde hali ahzirda margin bulundurur.
            // padding -> icten kisitlar
            // margin -> distan kisaltir.
            margin: ProjectMargins.cardMargin,
            //shape: StadiumBorder(),
            //shape: CircleBorder(),
            color: Theme.of(context).colorScheme.error,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const SizedBox(
              height: 100,
              width: 150,
              child: Center(
                child: Text(
                  'Gorkem',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          _CustomCard(
              child: const SizedBox(
            height: 100,
            width: 300,
            child: Center(
              child: Text('Gorkem'),
            ),
          ))
        ],
      ),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
  static final roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
}

// borders:
// stadiumborder
// circlebırder
//roundedrectangleborder

class _CustomCard extends StatelessWidget {
  const _CustomCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // eger custom card'sa sadece card icermeli. sizedbox vs olmamalı.
    // ama disaridan widget alabilir.
    var roundedRectangleBorder =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    return Card(
      margin: ProjectMargins.cardMargin,
      color: Colors.white,
    );
  }
}
