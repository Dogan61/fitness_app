import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/error/failures.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
