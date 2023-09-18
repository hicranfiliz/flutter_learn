import 'package:dio/dio.dart';

mixin class ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}
