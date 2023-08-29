import 'package:flutter/material.dart';
import 'package:flutter_learn/product/counter_hello_button.dart';
import 'package:flutter_learn/product/language/language_items.dart';

// burasi stateless gibi calisir. degismez yerler, d,saridan data al ver ytaptigimiz kisim.
// disariyla haberlesmeyi burasi yapar.
class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

// icinde state'leri hayat,i tutan class.
// asil kisim:
// dogru olan countValue'ya sadcee bu fileDAn erisilsin istiyorsam bunu private yaparim.
// ve iki tane ayni metodu (increment/deincrement) ayri ayri yazmaya gerek yok.kod tekrari.
class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement) {
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            _countValue.toString(),
            style: Theme.of(context).textTheme.displayMedium,
          )),
          const Placeholder(),
          const CounterHelloButton()
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    print('burda');
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
