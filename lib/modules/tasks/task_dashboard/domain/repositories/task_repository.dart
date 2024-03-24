import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, dynamic>> getTask(Map<String, dynamic> body);
}
