import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/fetch_count_repository.dart';

class FetchCountUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(memberId) async {
    return await serviceLocator
        .get<FetchCountRepository>()
        .getFetchCountByMemberId(memberId);
  }
}
