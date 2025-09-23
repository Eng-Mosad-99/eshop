import 'package:eshop/core/networking/api_result.dart';
import 'package:eshop/features/auth/data/services/auth_services.dart';

import '../../../../config/cache/cache_constants.dart';
import '../../../../config/cache/cache_helper.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class AuthRepo {
  final AuthService service;

  AuthRepo({required this.service});

  Future<ApiResult<LoginResponse>> login(
      {required LoginRequestBody body}) async {
    try {
      final response = await service.login(body: body);
      await CacheHelper.setSecureData(
        key: CacheConstants.accessToken,
        value: response.accessToken,
      );
      await CacheHelper.setSecureData(
        key: CacheConstants.refreshToken,
        value: response.refreshToken,
      );
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.error(e);
    }
  }
}
