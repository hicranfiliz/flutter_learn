import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});
// birden cok padding varsa butun hepsinin ayni yerden baslamasi icin bunu
// yani padding'i ana widget'a vermelyiz. ana widget'i (burada column) padding ile sarmalamaliyiz.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.PagePaddingVertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: ProjectPadding.PagePaddingVertical +
                  ProjectPadding.pagePaddingLeftOnly,
              child: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                height: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text('hicran'),
            ),
          ],
        ),
      ),
    );
  }
}

//butun sayfalarda ayni padding olmali. uygulamanin ana logicleri.
class ProjectPadding {
  // ignore: non_constant_identifier_names, constant_identifier_names
  static const PagePaddingVertical = EdgeInsets.symmetric(vertical: 10);
  static const pagePaddingLeftOnly = EdgeInsets.only(left: 20);
}
