import 'package:flutter/material.dart';
import 'package:flutter_learn/202/service/comment_model.dart';
import 'package:flutter_learn/202/service/post_service.dart';

class CommntsLearnView extends StatefulWidget {
  const CommntsLearnView({super.key, this.postId});

  // bu related oldugu icin id tiklanmis karttan  gelecek!!
  // bu sayfaya gelecek data bana postId'sini yollasin.
  final int? postId;

  @override
  State<CommntsLearnView> createState() => _CommntsLearnViewState();
}

class _CommntsLearnViewState extends State<CommntsLearnView> {
  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    // proje baslarken bu metodumu bu sekilde call ediyorum.
    fechItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fechItemsWithId(int postId) async {
    _changeLoading();
    _commentsItem = await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _commentsItem?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text(_commentsItem?[index].email ?? ''),
            );
          }),
    );
  }
}
