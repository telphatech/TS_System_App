import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class FetchCountRepository {
  Future<Either<Failure, dynamic>> getFetchCountByMemberId(String memberId);
}
