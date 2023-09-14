// 1.
// ilk olarak hangi servisi baglayacaksan onu yaz.
// sonra internete istek atmak icin dio'ya ihtşyacim var. Sonra dio'yu ver.

// Neden ui'dan aliyorum? Servis class'i disaridan bu islemmi alsin ki
// burada servisle baseurl ile ugrasmayalim. disaridan alacak sekilde ekleyelim..
// sonra geriye bir sey dondurecekse ve internete cikacaksa future yapiyorum.
// Burada liste dondurecegim. Dondurulecek model ResourceModel ama gelmeyebilir null yaptik.

// sonra class'imi yaziyrum interface'i extend edip.
// sonrasinda istek atacagim. Response ile cevabi saglayaacagim..  dio ile istek atiyorum. Basina daha senkron olmasi adina await attim.
// Burada da baseurl kuraacagim..
// sonra cevabin dogrulugunu kontrol ediyorum..
// httpsttaus ok geldikten sonra jsonBody'ye response icersindeki data'yi veriyorum.
// eger jsonbody listeyse jsonbody'yi mapleyerek resource modelin icersindeki fromjson'a gore geri don.

// ayriyeten bir enumeration yapip resource'in name'i path'ini verip kodu daha kontrollu yazabilirz.
// tek fark: normlade dio'yu class'in icinde veriyorduk Dio'yu bu sefer view yolayacak.

// servis isteklerini viewModel'da yap.
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_learn/303/reqres_resource/model/resource_model.dart';

abstract class IReqreService {
  final Dio dio;

  IReqreService(this.dio);

//
  Future<ResourceModel?> fetchResourceItem();
}

enum _ReqResPath { resource }

class ReqresService extends IReqreService {
  ReqresService(super.dio);

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get('/${_ReqResPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
