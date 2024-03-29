import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/tasks/task_dashboard/domain/repositories/group_id_repository.dart';

class GroupIdUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(grpId) async {
    return await serviceLocator.get<GroupIdRepository>().getGroupId(grpId);
  }
}
