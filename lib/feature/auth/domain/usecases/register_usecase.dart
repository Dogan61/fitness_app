import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/error/failures.dart';
import 'package:fitness_app/core/usecases/usecase.dart';
import 'package:fitness_app/feature/auth/domain/entities/user.dart';
import 'package:fitness_app/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<User, RegisterParams> {
  const RegisterUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(RegisterParams params) {
    return _repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });
  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}
