import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class CheckOutRepository {
  Future<Either<Failure, dynamic>> checkOut(String memberId);
}
