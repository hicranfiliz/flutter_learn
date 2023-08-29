import 'package:flutter/material.dart';
import 'package:flutter_learn/product/language/language_items.dart';

// counter button'i buraya ayri stateful olarak yazmamizin nedeni,
// bir component digr componentleri etkilemesin. hepsi ayri calissin
// bunu ana sayfada yaptigimizda baska bir component icine print attigimizda
// bu button da onu etkiliyor, print'i ayzdiriyordu.
// bu sekilde baska component'leri etkilemeyecek.
class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  // hic degismeyecek old icin finla yapiyorum.
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _updateCounter, child: Text('$_welcomeTitle $_counterCustom'));
  }
}
