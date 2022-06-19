import 'package:dartz/dartz.dart';
import 'package:kratos/data/requests.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/data/failure.dart';

abstract class Repository {
  Future<Either<Failure, User>> login(LoginRequest loginRequest);
  Future<Either<Failure, User>> loginById(int id);

  Future<Either<Failure, int>> register(
      RegisterRequest registerRequest);

}