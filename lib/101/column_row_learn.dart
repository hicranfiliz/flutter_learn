import 'dart:ffi';

import 'package:flutter/material.dart';

//response tasarim icin column ve row cok onemli!!.
class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // expanded kac tane component varsa ekranı o kadar esit parcaya bolerek responsive tasarim saglar.
          // ve expanded sadece row ve columnlarda kullanılır.
          // 4+2+2+2 = 10
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.orange)),
                  Expanded(child: Container(color: Colors.purple)),
                  Expanded(child: Container(color: Colors.pink)),
                ],
              )),
          const Spacer(flex: 2),
          const Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [Text('a'), Text('b'), Text('c')],
              )),
          const SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(children: [
              Expanded(
                child: Text('data'),
              ),
              Expanded(
                child: Text('data'),
              ),
              Expanded(
                child: Text('data'),
              ),
              Expanded(
                child: Text('data'),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

// container height'i constant olacagi icin buraya yaziyoruz. asla elle yazmiyoruz.
class ProjectContainerSizes {
  static const double cardHeight = 200;
}
