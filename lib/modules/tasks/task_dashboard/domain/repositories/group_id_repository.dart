import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class GroupIdRepository {
  Future<Either<Failure, dynamic>> getGroupId(String grpId);
}
