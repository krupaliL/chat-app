import 'dart:developer';

import 'package:chat_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:chat_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = FlutterSecureStorage();

  AuthBloc({
    required this.registerUseCase,
    required this.loginUseCase,
  }) : super(AuthInitial()){
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try{
      log("${event.username} * ${event.email} * ${event.password}", name: "paramRegister");
      final user = await registerUseCase(event.username, event.email, event.password);
      emit(AuthSuccess(message: 'Registration successful'));
    } catch(e){
      log("$e", name: "onRegister");
      emit(AuthFailure(error: 'Registration failed'));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    try{
      final user = await loginUseCase(event.email, event.password);
      await _storage.write(key: 'token', value: 'user.token');
      emit(AuthSuccess(message: 'Login successful'));
    } catch(e){
      log("$e", name: "onLogin");
      emit(AuthFailure(error: 'Login failed'));
    }
  }
}
