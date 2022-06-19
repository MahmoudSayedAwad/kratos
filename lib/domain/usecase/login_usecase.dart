

import 'package:dartz/dartz.dart';
import 'package:kratos/data/failure.dart';
import 'package:kratos/data/requests.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/domain/repository/repository.dart';

import 'base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, User> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, User>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.name, input.password));
  }
}

class LoginUseCaseInput {
  String name;
  String password;

  LoginUseCaseInput(this.name, this.password);
}
