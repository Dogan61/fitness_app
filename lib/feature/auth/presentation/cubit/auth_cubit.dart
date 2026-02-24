import 'package:fitness_app/feature/auth/domain/usecases/login_usecase.dart';
import 'package:fitness_app/feature/auth/domain/usecases/register_usecase.dart';
import 'package:fitness_app/feature/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        super(const AuthInitial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await _registerUseCase(
      RegisterParams(name: name, email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  void logout() {
    emit(const AuthUnauthenticated());
  }
}
