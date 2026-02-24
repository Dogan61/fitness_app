import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/auth/domain/entities/user.dart';
import 'package:fitness_app/feature/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  const LoginUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return _repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
