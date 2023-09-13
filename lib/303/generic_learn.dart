// GENERIC: Programlamada bazi senaryolarda ne gelecegini bilemiyoruz
// Ne gelecegini bilemedigimiz duurmlarda uygulamayi kullanacak kisiden
// bana bir sey yolllasin ama a'nn arkadasi olsun..
// Yani bu generic'lerle duurmlari sıkıstırabilirlim. ve
// - bana  a'nin arkadasi olan herkes donsun diyebilirlim
// - bana sadece a donsun diyebilirlim ya da
// - bana su sekiilde donsun gibi islemler yapabilirlim..

// UserManagement'i kullanacak kisinin admin olmasini istiyorum..
class UserManagement<T extends AdminUser> {
  // sadece bunu yazarak : final AdminUser admin;
  // bu metodu kullanacak kisinin admin olmasini digerlerinini kullnanmamasini engellleyemiyprum
  // engellemek icin: T tipi vermeliyiz..
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;
    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
    final _money = users.fold<int>(initialValue, ((previousValue, element) => previousValue + element.money));
    print(sum);
    return _money;
  }

// sadece liste dondureceksem update gibi islerim yoksa sadcee show varsa boyle yapabililrim.
// ve bunu sadece role tipi 1 olanlar gorebilsin istersem:.

// name'leri karakterine gore split ettim, array yaptim bunu toList' yapip
// R'ye cast ettim..
  Iterable<HFModels<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => HFModels<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

// hepsinde olmasini istedigim ozellikler::
class HFModels<T> {
  final String name = 'hf';
  final List<T> items;

  HFModels(this.items);
}

class GenericUser {
  final String name;
  final String id;
  final int money;

  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;
  AdminUser(super.name, super.id, super.money, this.role);
}
