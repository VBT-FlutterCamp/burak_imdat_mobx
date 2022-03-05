import 'package:burak_imdat_mobx/core/exception/env_not_found.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance => _instance ??= NetworkManager._init();

  final String _baseURL = 'BASE_URL';
  late final Dio dio;

  NetworkManager._init() {
    final url = dotenv.env[_baseURL];
    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));
      dio.interceptors.add(PrettyDioLogger());
    } else {
      throw EnvNotFoundException(_baseURL);
    }
  }
}
