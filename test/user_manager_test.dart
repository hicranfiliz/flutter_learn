import 'package:flutter_learn/202/cache/user_model.dart';
import 'package:flutter_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User Calculate Test', () {
    final users = [
      GenericUser('hf', '11', 10),
      GenericUser('gd', '35', 10),
      GenericUser('nf', '343', 22),
    ];

    final userManagement = UserManagement(AdminUser('hadmin', '1', 15, 1));
    final result = userManagement.calculateMoney(users);
    final response = userManagement.showNames<String>(users);

    expect(result, 42);
  });
}
