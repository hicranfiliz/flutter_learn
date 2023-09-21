import 'package:dio/dio.dart';

class ProjectNetworkManager{
   ProjectNetworkManager._(){
    _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
    _dio.options =BaseOptions();
  }

// her yerde kullanacagim dersem => late kullaniyorum. (lazy)
   late final Dio _dio;

   static ProjectNetworkManager instance = ProjectNetworkManager._();

   Dio get service => _dio;

   void addBaseHeaderToToken(String token) {
     _dio.options =_dio.options.copyWith(
      headers: {
        "Authorization": token
      }
     );
   }

}

// yine bir tan everi gelsin istiyorum..
class DurationManager{
  // bu sekilde private metodunu yaziyoruz ve bu class disaridan instance almaya kapatilmis oluyor.
  // sadece bu file icindeki instance'i alabilir.
  DurationManager._();
   static DurationManager? _manager;

   static  DurationManager get manager  {
if(_manager!= null) return _manager!;
_manager = DurationManager._();
return _manager!;
   }
}
