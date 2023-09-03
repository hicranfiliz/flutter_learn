import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn/202/service/comment_model.dart';

import 'post_model.dart';

// BEST PRACTICE!!!
// Metotlari kapatip, bu metotlara sadece interface uzerinden erisilsin.
abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItemAdvanced();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  // late olmadan kullanma:
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

// bu servisi disaridan kullanacgim icin erisilebilir olmasi lazim.
// _addItemToservice yapamam!!
// 2. durum: future void degil, islem basariliysa boolean deger dondurmeli.!!
  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

// update'lemek icin model lazim ve hangsiini guncelleyecegimi bilmek icin id de lazim..
  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

// delete yapmak daha kolay, dogrudan post'un id'sine gidiyorum ve
// data almama gerek yok!!
  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id');

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

// bir diger nokta: Burada liste donmem gerek. Ve bu liste de PostModel olacak
// ama servisten data gelmemis olabilir yani list nullable olabilir.
// bu durumda else ile null dondurmem lazim.
  @override
  Future<List<PostModel>?> fetchPostItemAdvanced() async {
// asenkron oldugundan bitmeden bi alta gecmez!
    // dio get future yani generic tip doner. Bunu kullanmak icin response'a atayip await eklemem gerekir.
    // await eklemek demek , bu kodu bekle bu koddan sonrasina gecme dmeek.
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        // data'nin generic olarak ne old anlamis oluyorum..
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      // print'i her seferinde burada yazmak yerine showdebug class'i icinde kullan
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

// fetch'le hemen hemenn ayni calisir. Farkli oldugu konu: queryParameters..
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(
        _PostServicePaths.comments.name,
        queryParameters: {_PostQueryPaths.postId.name: postId},
      );

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

// posts regues'leri elle yazmamak icin bir enum olusturuyorum..
enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
