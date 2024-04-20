import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/modules/leave/apply_leave/data/models/apply_leave_request_model.dart';

abstract class ApplyLeaveRepository {
  Future<Either<Failure, dynamic>> applyLeave({
    required ApplyLeaveRequestModel body,
  });
}
