// neden finla kullandik? kullanmasam ne olur?
// bir sinif icersinde her hangi bir variable'i initialize etmek zorundayim
// initialize demek bu deger kesin olacak mi? icersinde ne olacak?
// ve bunlari initialize etmenin 4 yolu var..

// ilki benim variable'larimin hepsi null gelebilir..
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
}

// 2. yontem constructor olusturmak. Bu variable'lar uygulama olustugunda gelecek derim.
class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

// 3. yontem hepsinin basina final atamak.
// Bu variable'lar sadece contructor zamanainda gelebilir ve initialize edilebilr.
// baska zaman bu data'lar gelemez.
class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3({required this.userId, required this.id, required this.title, required this.body});
}

// 4.yontem musteri bunlari elle yazsin, named girsin. O zaman construcotrda unlari
// suslu parantz icinde yazarim.
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

//5.yontem.. en tavsiye edilen..
// variable'i alip musteriye vermiyprum.
// variable'larin hepsi private.
// bunun da 2 kullanimi var. Biri bu sekilde : ile esitlemek..
class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  // {
  //     _userId = userId,
  //     _id = id,
  //     _title = title,
  //     _body = body,
  // };
}

/// digeri de late atamak yani bu ddeger sonradan gelecek demek.
class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

// required deger vermiyoruz ve bir default deger belirleyebiliyoruz..
class PostModel7 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    int userId = 0,
    int id = 0,
    String title = "",
    String body = "",
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}
