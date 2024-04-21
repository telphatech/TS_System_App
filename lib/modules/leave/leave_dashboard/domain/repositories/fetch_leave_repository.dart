import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class FetchLeavesByMemberIdRepository {
  Future<Either<Failure, dynamic>> getFetchLeavesByMemberId(String memberId);
}

abstract class FetchLeavesRepository {
  Future<Either<Failure, dynamic>> getFetchLeaves();
}

abstract class FetchLeaveDetailsRepository {
  Future<Either<Failure, dynamic>> getFetchLeaveDetailsByLeaveId(
      String leaveId);
}
