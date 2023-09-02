import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'a');
  @override
  void initState() {
    super.initState();

// bu class'ta nullable olabilir dedeiigm icin ve constructor vermedigim icin
// bizden deger istemedi.
// bunlari 2 sekilde kullanabilirm:
    final user1 = PostModel()
      ..userId = 1
      ..body = 'hf';
    user1.body = "hello";

// postmodel2 class'i bizden deger bekliyor cunku const verdik.
// ve body'sini vs degistirebiliyorum cunku bu variablelari final tanimlamadik.
// final sonradan degistirilemez!!!
    final user2 = PostModel2(1, 2, 'a', 'b');
    user2.body = 'hf';

// burada da contrustor verdigimiz icin icine degerler aldi.
// ama sonradan atama yapamadik cunku variable'lar final olarak tanimlandi
    final user3 = PostModel3(1, 1, 'a', 'bb');
    //user3.body = 'abc';

// burada da yine icine deger bekliyor cunstroctor'dan dolayi
// ve parametreler named parametre olak geldi cunku required kullandik.
// local'de bu islemleri yapıyşrsam guncelleme vs bu yontem daha mantikli!!!
    final user4 = PostModel4(userId: 1, id: 2, title: 'a', body: 'aaa');

// burada da user5'in icinde hicbir sey goremeyiz cunku variable'lar private yaptik.
// bunlara erismek icin encapsulation kurallarina gore getter ve setter'larini vermem gerekir.
    final user5 = PostModel5(userId: 1, id: 1, title: 'a', body: 'bn');
//user5.
    user5.userId;

// yine user6 uzerinden variable'lara erisemeyiz. safety olmasi acisindan onemlidir.
    final user6 = PostModel6(userId: 1, id: 1, title: 'aa', body: 'bb');

// burada hicbir sey vermiyoruz. Veermedigimiz durumda default degerleri aliyor.
    final user7 = PostModel7();

// servis'ten data cekiorsam en mantiklisi bu!!!!
    final user8 = PostModel8(body: 'bdsv');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bunu yukarida final user9 = PostModel8(body: 'a');  seklinde vermissem
      // onppressed ile degistiremem cunku variable'lar final
      // bunu degisebilir yapmak icin ya PostModel8 user9 = PostModel8(body: 'a');
      // ya da var user9 = PostModel8(body: 'a'); yapmaliyim. yani sonradan degisebilir.
      // guncellenmesini istiyosam da setstate icine yazmam gerekiyor.

      // bunu bu sekilde title'i tiklaninca degistirmek icin deger verip
      // tekrar body'ye dondugumde body'yi göremem cunku bu da gider, degisir,
      // degismememesi icin modelleme tarafinda generate CopyWith metodunu kullanmam lazim
      // bu instance'in bir copy'sini olusturuyor ve sadece verdigimiz variablE'larla
      // degisik olanlari ekliyor. Yani body'nin ilk instance'ini degistirmeyecek.
      // tekrar body'ye donduugumde bunun icerigii gorebilecegim.
// bunu kullanırken de user9 = PostModel8(title: 'On pressed');   boyle degil asagidak gibi kullaniyorum..

// !!!! ozellikle listeleri yaparken; listeler referrans tuuttuklari icin bu itemlari update ederken
// kayma yasamamak icin copywith kullanacagiz.
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: 'hf');
          // mesela user9'un body'si final olmasin ve sonradan degisebilir olsun..
          // yine de body'yi asla buradan bu sekilde degistirmiyorum .
          // Elimde zaten bir model var. Update'lemek icin bu modelin icinde metotla guncellmeliyim.
          // user9.body = 'abc;  yazmak yerine bu fonks kullanabiliriz.
          user9.updateBody('abc');
          // user9.updateBody(null); buraya null da atsam body degismeyecek ve bu sayede kod korunmus oluyor.
        });
      }),
      // bunu text(user9.body) diye set edemem cunku text her zaaman String alir.
      // benim degiskenim nullable tipinde.

      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}
