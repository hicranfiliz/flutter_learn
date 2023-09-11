import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    // item'lari map'leyip json'lari decode ve encode etmek
    // json encode etmek -> butun modellerin aslinda  bir string olabilir.
    // json decode -> bir obje haline getirmek..
    // yani json encode ettiginde bir stringe ceviriyorum, decode ettigimde tekrar bir obje'ye ceviriyorum.

    // element ile listenin butun elemanlarini donuyor.
    // COMPUTE..
    final _items = items.map((element) => jsonEncode(element)).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemString = sharedManager.getStrings(SharedKeys.users);
    // eger bossa if blogu icine gir degilse false don!
    if (itemString?.isNotEmpty ?? false) {
      return itemString!.map((element) {
        final jsonObject = jsonDecode(element);

        return User('name', 'description', 'url');
      }).toList();
    }
    return null;
  }
}
