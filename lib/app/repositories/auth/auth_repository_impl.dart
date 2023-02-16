import 'dart:async';
import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/repositoryExcepition.dart';
import 'package:delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:delivery_app/app/core/rest_client/custon_dio.dart';
import 'package:delivery_app/app/models/auth_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustonDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.auth().post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permisaão negada ao usuario.', error: e, stackTrace: s);
        throw UnauthorizedException();
      }
      log('Erro ao fazer login', error: e, stackTrace: s);
      throw RepositoryExcepition('Erro ao fazer login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unuauth().post('users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      throw RepositoryExcepition('Erro ao registrar usuário');
    }
  }
}
