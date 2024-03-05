import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class UseCaseNoInput<Output> {
  Future<Either<Failure, Output>> invoke();
}

abstract class UseCaseOneInput<Input, Output> {
  Future<Either<Failure, Output>> invoke(Input input);
}

abstract class UseCaseTwoInput<Input, Input1, Output> {
  Future<Either<Failure, Output>> invoke(Input input, Input1 input1);
}

abstract class UseCaseThreeInput<Input, Input1, Input2, Output> {
  Future<Either<Failure, Output>> invoke(
      Input input, Input1 input1, Input2 input2);
}

abstract class UseCaseFourInput<Input, Input1, Input2, Input3, Output> {
  Future<Either<Failure, Output>> invoke(
      Input input, Input1 input1, Input2 input2, Input3 input3);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
