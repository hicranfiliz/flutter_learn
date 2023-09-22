import 'package:flutter/material.dart';

class NavigateHomeDetailView extends StatefulWidget {
  const NavigateHomeDetailView({super.key, this.id});

// buraaya home gelecegi icin bana bir string id ile gelsin diyorum..
  final String? id;

  @override
  State<NavigateHomeDetailView> createState() => _NavigateHomeDetailViewState();
}

class _NavigateHomeDetailViewState extends State<NavigateHomeDetailView> {
   String? _id;
  @override
  void initState() {
    super.initState();

    _id = widget.id;
    if(_id == null){
       // ModelRoute uzerinden datayi alabilirm..
    // ama bunu ekran draw edilirken cagiramiyoruz. Ekran draw2i bittkten sonra cagirabilirlm.
    // Bunun icin FUTURE.MICROTASK kllanmaliyim. bu ekran drwa'i bitikten sonra calis demek.
    // ama id'ye dikkat et. id'yi late degil null olabilir diye set ediyorum.
    Future.microtask(() {

        final _modelId = ModalRoute.of(context)?.settings.arguments;
        // if (_modelId is String) {
        //   _id = _modelId;
        // }else{
        //   _id = widget.id;
        // }
    setState(() {
          _id = _modelId is String ? _modelId : widget.id;

    });
    });
    
    }

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.error,
      appBar: AppBar(title: Text(_id ?? ''),),
    );
  }
}