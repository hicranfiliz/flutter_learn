import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({super.key});

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

// HER SENARYODA KEY'LERI ENUM ILE SAKLAMAM GEREKIYOR!!!!!

enum _SecureKeys { token }

/// secure kullnamamiizin amaci , uygulama silinse de tekrar yuklndiginde
/// datalarin var olmasi.
class _SharedContextLearnState extends State<SharedContextLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  TextEditingController _controller = TextEditingController();

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print("Bu app onceden kullanilmis ve token'i bu: ");
      _controller.text = _title;
    }
    // ekranda guncellemek icin..
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: const Text('Save')),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
