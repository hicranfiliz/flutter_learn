import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_learn/303/reqres_resource/view/reqres_view.dart';
import 'package:flutter_learn/product/service/project_dio.dart';

// 2...
// view 'deki State<ReqResView> extend ediyor. View file'indaki de ReqResViewModel  extend edecek.
// Bu sayede bunlar birbiriyle haberlesiyor. Yani logic'lerimi artik bubrasi yonetecek.
// Sonra initstate yapacagim ama oncesinde ReqResService' e ihtiyacim var.
// late final verirsem sadece init state icersinde esitleyebilecegiim anlamina gelir.
// Ama her yerde bu dio'yu yazmak yerine bunun bir instance'i olabilir.
// Bunu product altinda service klasoru altinda verebilirlim.
// changeLoading metoduna erismek istersem LoadingStatefull'u boyle dahil edebilirlm.

// sonrasinda datayi fetch etme:
abstract class ReqResViewModel extends LoadingStatefull<ReqResView> implements ProjectDioMixin {
  late final IReqreService reqreService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqreService = ReqresService(service);
    //changeLoading();
    _fetch();
  }

// bu sekilde loading kodunu bir daha yazmiyorum.
// fetch sadece burada kullanilacagi icin _ attik.
  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqreService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }

  // reqresViewModel'da datalar yuklendikten sonra locale save edilsin..
  // Burada context'e ihtiyacim var.
}
