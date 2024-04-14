import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_leave_repository.dart';

class FetchLeavesUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(memberId) async {
    return await serviceLocator
        .get<FetchLeavesRepository>()
        .getFetchLeavesByMemberId(memberId);
  }
}
