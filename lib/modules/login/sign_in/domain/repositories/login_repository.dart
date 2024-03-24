import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, dynamic>> getEmpLogin(Map<String, dynamic> body);
}
