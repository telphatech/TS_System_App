import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class GroupRepository {
  Future<Either<Failure, dynamic>> getGroup(String grpId);
}
