import 'package:flutter/material.dart';
import 'package:flutter_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            CallBackDropdown(onUserSelected: (CallbackUser user) {
              print(user);
            }),
          ],
        ));
  }
}

// dropdown'da gosermek istedigim kullanici ozellikleri:

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

// :TODO:  Dummy. Remove it.
  static List<CallbackUser> dummyUsers() {
    return [CallbackUser('hf', 1), CallbackUser('hf2', 2)];
  }

// listelerin icindeki iki item refreansi aslinda ayni. Bu yuzden bunlari esit sayiyor
// Ama == override ederek; iki item'in ayni olmasai icin, CallbackUser olsa bile name ve id'leri ayni olmak zorunda.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }
}
