

import 'package:dio/dio.dart';

class ProjectItems{
  ProjectItems._();
  static const String projectName = 'HF10';
  // projectitems'dan yeni bir instance uretilmesini engeller.
  
}

// ama network manager katmani yaparken boyle kullanmak cok mantikli degil.

// class ProjectNetworkManager{
//    ProjectNetworkManager._(){
//     _dio = Dio(BaseOptions(baseUrl: 'pub.dev'));
//   }

//    late final Dio _dio;

//    static ProjectNetworkManager instance = ProjectNetworkManager._();

//    Dio get service => _dio;

// }