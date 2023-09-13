import 'package:flutter/material.dart';
import 'package:flutter_learn/303/call_back_learn.dart';

// sadece burada statefulll calisiyor. souc olarak bu on tarafi tetiklemeyeck
// ve sadece kendi icerisinde calisacak.
class CallBackDropdown extends StatefulWidget {
  const CallBackDropdown({super.key, required this.onUserSelected});

  final void Function(CallbackUser user) onUserSelected;
  @override
  State<CallBackDropdown> createState() => _CalBackDropdownState();
}

class _CalBackDropdownState extends State<CallBackDropdown> {
  CallbackUser? _user;

  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });
    // bu islem oldugunda ekrana haber ver!!
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    // DropdownButton benden generic type istiyor. CallbackUser gonderdim.
    return DropdownButton<CallbackUser>(
        value: _user,
        items: CallbackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(
              e.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          );
        }).toList(),
        onChanged: _updateUser);
  }
}
