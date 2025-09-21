import 'package:bloc/bloc.dart';
import 'package:eshop/core/networking/api_error_model.dart';
import 'package:eshop/features/auth/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/login_request_body.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
  final AuthRepo repo;

  login({required LoginRequestBody body}) async {
    emit(LoginLoading());
    final result = await repo.login(body: body);
    result.when(
      onSuccess: (_) => emit(LoginSuccess()),
      onError: (error) => emit(LoginError(error: error)),
    );
  }
}
