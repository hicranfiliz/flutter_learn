import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/model_learn.dart';
import 'package:flutter_learn/202/service/post_model.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;

  // burada oading gostermek istiyorsam:
  bool _isLoading = false;

// bunu proje basladigi ilk anda cagisaracaksak initstate icine yazariz.
  // initstate icinde await diyemem. cunku bu bir constructordir ve async olmaaz. runtime'da calisir ve biter.
  @override
  void initState() {
    super.initState();
    name = 'hicran';
    fetchPostItems();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
// asenkron oldugundan bitmeden bi alta gecmez!
    // dio get future yani generic tip doner. Bunu kullanmak icin response'a atayip await eklemem gerekir.
    // await eklemek demek , bu kodu bekle bu koddan sonrasina gecme dmeek.
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      // data'nin generic olarak ne old anlamis oluyorum..
      if (_datas is List) {
        // maplemek yeni bir obje uretmek demek.
        // amac bu listeyi yeni bir liste yapmak..
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ''),
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // uzunluk null'sa 0 ata.
          itemCount: _items?.length ?? 0,
          itemBuilder: (context, index) {
            return _PostCard(model: _items?[index]);
          }),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
