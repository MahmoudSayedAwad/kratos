import 'package:kratos/data/requests.dart';
import 'package:kratos/data/response/response.dart';

import 'app_api.dart';

abstract class LocalDataSource {
  Future<UserResponse> login(LoginRequest loginRequest);
  Future<UserResponse> loginById(int id);

  Future<int> register(RegisterRequest registerRequest);
}

class LocalDataSourceImpl implements LocalDataSource {
  final AppServiceClient _appServiceClient;
  LocalDataSourceImpl(this._appServiceClient);

  @override

  Future<UserResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.name, loginRequest.password);
  }

  @override
  Future<int> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.name,
        registerRequest.password,
        registerRequest.workingHours,
        registerRequest.gender,
        registerRequest.weight,
        registerRequest.height,
    registerRequest.email,
    registerRequest.phone,
    registerRequest.age);
  }

  @override
  Future<UserResponse> loginById(int id) async{
    return await _appServiceClient.loginById(id);
  }
}
