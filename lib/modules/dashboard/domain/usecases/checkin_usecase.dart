import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/usecase/use_case.dart';
import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkin_repository.dart';
import 'package:ts_system/modules/dashboard/domain/repositories/checkout_repository.dart';

class CheckInUseCase implements UseCaseOneInput<CheckInModel, dynamic> {
  @override
  Future<Either<Failure, dynamic>> invoke(CheckInModel body) async {
    return await serviceLocator.get<CheckInRepository>().checkIn(body: body);
  }
}

class CheckOutUseCase implements UseCaseOneInput {
  @override
  Future<Either<Failure, dynamic>> invoke(memberId) async {
    return await serviceLocator.get<CheckOutRepository>().checkOut(memberId);
  }
}
