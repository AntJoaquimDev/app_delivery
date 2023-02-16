import 'package:delivery_app/app/core/global/global_context.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accesToken = sp.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accesToken';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Redirecionar o usuario para tela Home
      GlobalContext.inst.loginExpire();
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      handler.next(err);
    } else {
      handler.next(err);
    }
  }
}
