import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/post_model.dart';
import 'package:flutter_learn/202/service/post_service.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

// PEKI O SAYFAYA TEKRAR GELDIGIMDE, POST SERVICE GIRDIGIMDE
// ISTEGOIN TEKRAR TEKRAR ATILMAMASI ICIN:
// Bu sayede bu state'i korumaya aldim. Farkli sayfaya dondugumde kaybetmiyorum.

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();
  late final Future<List<PostModel>?> _itemsFuture;
  @override
  void initState() {
    super.initState();
    // bu sekilde yeni bir setstate'den etkilenemeyecek.
    _itemsFuture = _postService.fetchPostItemAdvanced();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {});
      }),
      appBar: AppBar(),
      body: FutureBuilder<List<PostModel>?>(
          future: _itemsFuture,
          builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
            // int olmadiginda , int bekelediginde, aktif olarak devam ettiginde ve bittiginde
            // ne yapmasi gerektigini soyluyoruz..
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Placeholder();
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: ListTile(
                          title: Text(snapshot.data?[index].body ?? ''),
                        ));
                      });
                } else {
                  return const Placeholder();
                }
            }
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  // super'le verdigim context'i korumak istiyorum bu yuzden true donduruyorum.
  bool get wantKeepAlive => true;
}
