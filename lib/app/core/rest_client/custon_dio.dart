import 'package:delivery_app/app/core/config/env/env.dart';
import 'package:delivery_app/app/core/rest_client/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustonDio extends DioForNative {
  late final AuthInterceptor _authInterceptor;
  CustonDio()
      : super(BaseOptions(
          baseUrl: Env.inst['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
    ));
    _authInterceptor = AuthInterceptor();
  }
  CustonDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustonDio unuauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
