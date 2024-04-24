import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/leave/leave_dashboard/domain/repositories/holidays_repository.dart';

class HolidaysUseCase implements UseCaseNoInput {
  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await serviceLocator.get<HolidaysRepository>().getHolidays();
  }
}
