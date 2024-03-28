import 'package:either_dart/either.dart';
import 'package:ts_system/config/flavors.dart';
import 'package:ts_system/core/error/failure.dart';
import 'package:ts_system/core/network/api_provider.dart';
import 'package:ts_system/modules/login/sign_in/domain/repositories/invitation_repository.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class InvitationRepositoryImpl implements InvitationRepository {
  final _apiProvider = ApiProvider();

  @override
  Future<Either<Failure, dynamic>> invitationCode(String code) async {
    try {
      final response = await _apiProvider.getData(
        baseUrl: F.apiBaseUrl,
        subUrl: "/api-check_invitation_code.php",
        body: {
          "emp_invitation_code": code,
        },
      );
      if (response == null) {
        return Left(ServerFailure(message: AppUtils.noResponseFromServerText));
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
