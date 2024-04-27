import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class ViewAttendanceReportRepository {
  Future<Either<Failure, dynamic>> viewAttendanceReport();
}
