import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:kratos/data/mappers/mappers.dart';
import 'package:kratos/data/requests.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/domain/repository/repository.dart';

import '../error_handler.dart';
import '../failure.dart';
import '../dataSource/local_data_source.dart';


class RepositoryImpl implements Repository {


  final LocalDataSource _localDataSource;
  RepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, User>> login(
      LoginRequest loginRequest) async {

      try {
        final response = await _localDataSource.login(loginRequest);
        if (response.id != 0) {
          if (kDebugMode) {
            print(response.password);
          }

          return Right(response.toDomain());
        } else {

          return Left(Failure(
              response.id.toString()));
        }
      } catch (error) {
        //print(error.toString());
        return Left(ErrorHandler.handle(error).failure);

      }

  }



  @override
  Future<Either<Failure,int>> register(
      RegisterRequest registerRequest) async {


      try {
        final response = await _localDataSource.register(registerRequest);

        if (response > 0) {
          // success
          // return either right
          // return data
          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
              response.toString()));
        }
      } catch (error) {
        if (kDebugMode) {
          print("bbory"+error.toString());
        }
        return Left(ErrorHandler.handle(error).failure);
      }

  }

  @override
  Future<Either<Failure, User>> loginById(int id)async {
    try {
      final response = await _localDataSource.loginById(id);
      if (response.id != 0) {
        if (kDebugMode) {
          print(response.password);
        }

        return Right(response.toDomain());
      } else {

        return Left(Failure(
            response.id.toString()));
      }
    } catch (error) {
      //print(error.toString());
      return Left(ErrorHandler.handle(error).failure);

    }

  }


}
