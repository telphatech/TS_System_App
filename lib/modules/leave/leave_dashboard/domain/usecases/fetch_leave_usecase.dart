import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_leave_repository.dart';

class FetchLeavesByMemberIdUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(memberId) async {
    return await serviceLocator
        .get<FetchLeavesByMemberIdRepository>()
        .getFetchLeavesByMemberId(memberId);
  }
}

class FetchLeavesUseCase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<FetchLeavesRepository>().getFetchLeaves();
  }
}

class FetchLeaveDetailsUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(leaveId) async {
    return await serviceLocator
        .get<FetchLeaveDetailsRepository>()
        .getFetchLeaveDetailsByLeaveId(leaveId);
  }
}
