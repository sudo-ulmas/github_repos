import 'package:dio/dio.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://api.github.com/',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    validateStatus: (status) => status != null && status <= 500,
  );

  Dio get dio => Dio(_dioBaseOptions);
}
