// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:delivery_app/app/pages/auth/login/login_state.dart';
import 'package:delivery_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authMOdel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      //sp.clear();
      sp.setString('accessToken', authMOdel.accessToken);
      sp.setString('refreshToken', authMOdel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e) {
      log('Errro  login e senha inválidos',error: e);
      emit(state.copyWith(
          status: LoginStatus.loginError,
          erroMessage: 'Login ou senha inválidos'));
    } catch (e, s) {
      log('Errro ao realizar login', error: e,stackTrace: s);
      emit(state.copyWith(
          status: LoginStatus.error, erroMessage: 'Erro ao realizar Login'));
    }
  }
}
