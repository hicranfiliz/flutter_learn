import 'package:flutter/material.dart';

/// buraya yazdigim seyler degisemez ve sadece bir defa verilebilri. bir defa verilecegi icin de zorunlu.
class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({super.key, required this.message});
  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = '';

  late final bool _isEven;

// init state gibi calisir. intstateden sonra calisir.
// proje tekrardan update edildiginde calisir.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('c');
  }

// ust class'tan cagrilarak gelen durum
// controller'in trigger olma durumu degil.
  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

// sayfada ciktigi andir. sayfanin oldugu an.
  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

  // mesaj tekse tek, ciftse cift yaz.
  @override
  // class'larin iiçndeki const metod gibi dusunebiliriz.
  // inşştstate bittikten sonra build metot calisir.
  // init state icersine logic yazdigmiz yerde view'i guncelleyemeyiz.
  // cunıku daha initstate'de ekran cizilmemi olur. inirstateden sonra ekran cizilir.
  void initState() {
    super.initState();
    _message = widget.message;
    _isEven = widget.message.length.isEven;
    _computeName();
    print('a');
  }

  void _computeName() {
    if (_isEven) {
      _message += " Çift";
    } else {
      _message += " Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isEven
          ? ElevatedButton(
              onPressed: () {
                setState(() {
                  _message = 'a';
                });
              },
              child: Text(_message))
          : TextButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
