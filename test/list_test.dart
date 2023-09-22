
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_learn/303/generic_learn.dart';
import 'package:flutter_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

//7 !! listeler referans type oldugu icin..
//final olan list'e ekleme yapabilirli. guncelleme yapabilirim ama komple listeyi degistiremem. 
void main() {
  setUp(() {});
  test('List best of', () {
    List<GenericUser> users = [
      GenericUser('hf', '11', 10),
      GenericUser('gd', '35', 10),
      GenericUser('nf', '343', 22),
    ];

    // beni elimde user var ama highcard istiyor.
    // highcard'a dogrudan model'i verseydim ve o modeli orada update etseydi, buradaki model de bundan etkilenecekti.
    // map'lemenin amaci elimdeki model'den yeni bir model olusturmek
    List<HighCard> highCards = users.map((e){
      return HighCard(items: e.name.split('').toList());
    }).toList();

// buradaki name'i de aslinda buaraya yazmamam lazim. Model'e yazmam şazim.
// yani kafasina gore buraya bir name yazmasin, model'deki name'i yazsin.
// ve bunu try catch icinde yap!
try {
  // farkli element geldiginde uyg crash olmasin null gelsin istersem::
  //// orElse()  geriye  genericUser doner.
   final response = users.singleWhere((element) => element.findUserName('hx'),orElse: (){
    return GenericUser('name', 'id', 15);
   });
   print(response);
} catch (e) {
  print(e);
}

 //log('${ users.where((element) => element.money >5)}');
 print('${ users.where((element) => element.money >5)}');

 users.addAll([GenericUser('name', 'id', 5)]);
 // en sondan id'si 5 olan elemani getri. ama ya getiremzse:
 // Bu durumda asagidaki gini lastWhereOrNull kullaniyoruz..
 //users.lastWhere((element) => element.id == '2');

 users.take(5);
 // bir ensneyi direkt buradan silemeyiz. referans olmasiyla alakali.
 // Silebilmek icin modeli equatable'dan extend etmeliyiz.
 users.remove(GenericUser('hf', '11', 10));
 users.removeAt(2);
 users.removeWhere((element) => element.id == '11');

// indexof metodu listedeki bu elementin indexini verir.
 users.indexOf(GenericUser('hf', '11', 10));
 final result = users.indexWhere((element) => element.id == '11');
 if(result >= 0){
  users[result] = GenericUser('a', '4', 111);
 }

 // bu user listesine yeni bir liste entegre etmek istiyorum..
 users.expand((element) => [GenericUser('acc', '1', 10)]);

// userslari mapleyip builder gibi kullanabililriz.
 users.map((e) => e.money).where((element) => element>5);
   
  });

// listenin icersinde single bir data aradigimda ya yukaridaki gibi ya da boyle yapiyorum.
  test('List best of with collection ', () {
    List<GenericUser> users = [
      GenericUser('hf', '11', 10),
      GenericUser('gd', '35', 10),
      GenericUser('nf', '343', 22),
    ];


final response = users.singleWhereOrNull(
  (element) => element.findUserName('hx'),); 

  users.lastWhereOrNull((element) => element.id == '5');

  users.lastOrNull;
  users.forEachIndexed((index, element){});

  users.sample(3);
  print(users.first ==  GenericUser('hf', '11', 10));
 print( users.contains(GenericUser('hf', '11', 10),));

 users.any((element) => element.money>5);

  print(response);
   
  });
}