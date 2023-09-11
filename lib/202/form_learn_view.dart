import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  // key uzerinden; globalKey'i kullandigim icin formsttae ozelliklerini yakalayabiliyorum.
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        // her zaman calismaini istiyrsam AutoValidateMode'laari kullan..
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          print('a');
        },
        child: Column(
          // bu da yine textfield giib calisir. yine onchange'i , decoration'i var.
          // sadece farkli olarak validator diye bir metod vardir.

          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>(
                value: 'h',
                validator: FormFieldValidator().isNotEmpty,
                items: const [
                  DropdownMenuItem(value: 'h', child: Text('a')),
                  DropdownMenuItem(value: 'h1', child: Text('a')),
                  DropdownMenuItem(value: 'h2', child: Text('a')),
                ],
                onChanged: (value) {}),
            // checbox da var ama onun formfield'i yok
            CheckboxListTile(value: true, onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('Okay');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    //value isnotempty ise true, degilse false donecek
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bos gecilemez!';
}
