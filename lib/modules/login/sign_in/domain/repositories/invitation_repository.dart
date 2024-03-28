import 'package:either_dart/either.dart';
import 'package:ts_system/core/error/failure.dart';

abstract class InvitationRepository {
  Future<Either<Failure, dynamic>> invitationCode(String code);
}
