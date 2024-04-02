import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/modules/dashboard/data/models/checkin_model.dart';

abstract class CheckInRepository {
  Future<Either<Failure, dynamic>> checkIn({
    required CheckInModel body,
  });
}
