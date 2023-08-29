import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

// text field -> for componentleri yerine kullandigimiz component.
class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            // her karakter girdigimde container degissin. animasyonlu bir seklde.
            buildCounter: (BuildContext context,
                {required int currentLength, required bool isFocused, int? maxLength}) {
              return _animatedContainer(currentLength);
            },
            // klavye email tipinde acilir!!
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            autofillHints: const [AutofillHints.email],
            // keyword engelleme..
            inputFormatters: [TextProjectFormatter()._formatter],
            textInputAction: TextInputAction.next,
            // projelerde decoration da ortak olur. O yuzden bu inputdecoretion'i da class olarak cikartmamiz geekiryor.
            decoration: _InputDecoration().emailInput,
          ),
          TextField(
              focusNode: focusNodeTextFieldOne, minLines: 2, maxLines: 4, style: const TextStyle(color: Colors.pink))
        ],
      ),
    );
  }

  AnimatedContainer _animatedContainer(int currentLength) {
    return AnimatedContainer(
      key: key,
      duration: const Duration(milliseconds: 100),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
    );
  }
}

// keyword engelleme
class TextProjectFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    } else {
      return oldValue;
    }
  });
}

class _InputDecoration {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}
