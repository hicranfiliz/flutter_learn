import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
// importlari buraasi alir. Mesela part_appbar dosyasina yeni bir ozellik ekledim onun importunu bu sayfa alir.
// ornegin ticker gibi.
// partof'lari ozellikle musterini gormemsi gerekn durumlarda kullaniyoruz..
part 'part_appbar.dart';

class PartOfLearn extends StatefulWidget {
  const PartOfLearn({super.key});

  @override
  State<PartOfLearn> createState() => _PartOfLearnState();
}

class _PartOfLearnState extends State<PartOfLearn> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Eger widget kucukse metot olarak buyulkse widget olarak disari cikarmaliyiz.
      appBar: _PartOfAppbar(),
      body: Text('data'),
    );
  }
}

// appBar'in PreferrredSizeWidget olmasini istiyor Bu sebeple bunu implemente ettik.
// appbarda kendi widget'imi yapmak istersem buna sadece PreferredSizeWidget classini impplemente etmemm yeterli.

// Her widget disari cikmayabilri. Bazilari sayfaya ozel olabilir. O zamna yapmam gereken:
// Part_appbar dosyasi olusturup part ve part of ile yonlendirmek.


