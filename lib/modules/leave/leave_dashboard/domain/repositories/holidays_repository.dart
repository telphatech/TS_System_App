import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class HolidaysRepository {
  Future<Either<Failure, dynamic>> getHolidays();
}
