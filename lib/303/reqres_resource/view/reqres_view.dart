import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/303/reqres_resource/view_model/reqres_view_model.dart';

// 3...
// sayfam acildiginda bir istek atacak ve bu istegi title'da gosterebilirlm..
class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqResViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(resources[index].name ?? '');
        },
      ),
    );
  }

  @override
  // TODO: implement service
  Dio get service => throw UnimplementedError();
}
