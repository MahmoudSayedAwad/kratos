import 'package:dartz/dartz.dart';
import 'package:kratos/data/failure.dart';
import 'package:kratos/data/requests.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/domain/repository/repository.dart';

import 'base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, int> {
 final Repository _repository;
 RegisterUseCase(this._repository);
  @override
  Future<Either<Failure, int>> execute(RegisterUseCaseInput input)async {
    return await _repository.register(RegisterRequest(input.name, input.workingHours, input.weight,
        input.gender, input.password, input.height,input.email,input.phone,input.age));
  }
 Future<Either<Failure, User>> loginById(int id)async {
   return await _repository.loginById(id);
 }

}

class RegisterUseCaseInput {
  String name, password,  workingHours, gender,email,phone;
  int weight, height,age;
  RegisterUseCaseInput(this.name,this.password,this.workingHours,this.gender,this.weight,this.height,this.email,this.phone,this.age);
}
