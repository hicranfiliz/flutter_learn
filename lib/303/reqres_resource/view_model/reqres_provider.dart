// 7.
// Buraya reqresViewModel daki ayni logicler'i yaziyorum. Tek bir farkla
// Bu statefull class olmadigi icin bunun icersinde initstate falan goremeyiz.
// Bu normal constructor halinde calisisr.
// Sayfa Acilir acilmaz istek atmak istedigim icin bujnu artik bu constructor icinde yapacaagim..
import 'package:flutter/material.dart';
import 'package:flutter_learn/303/reqres_resource/model/resource_model.dart';
import 'package:flutter_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_learn/product/global/resource_context.dart';

// 9. isLoading yapicam..
// Burada artik setState yok cunku bu kendi logic'imiz. Kendi classimizi yaziyoruz.
// Ve burada her bu islem olduktan sonra buarda notifyListener kullan.
// Yani bu her changeLoding basladiginda dinleyip buna gore islemini yapacak demektir.
class ReqResProvider extends ChangeNotifier {
  final IReqreService reqreService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqResProvider(this.reqreService) {
    _fetch();
  }

// bu sekilde loading kodunu bir daha yazmiyorum.
// fetch sadece burada kullanilacagi icin _ attik.

  Future<void> _fetch() async {
    _changeLoading();
    try {
      resources = (await reqreService.fetchResourceItem())?.data ?? [];
    } catch (error) {
      // Hata mesajını yazdırabilir veya işleyebilirsiniz.
      print('Hata oluştu: $error');
      // Hata işleme kodları burada eklenir.
    } finally {
      _changeLoading();
    }
  }

  void saveToLocal(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
