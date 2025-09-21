import 'package:dio/dio.dart';
import 'package:eshop/core/networking/api_constants.dart';
import 'package:eshop/features/auth/data/models/login_request_body.dart';
import 'package:eshop/features/auth/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('auth/login')
  Future<LoginResponse> login({@Body() required LoginRequestBody body});
}
