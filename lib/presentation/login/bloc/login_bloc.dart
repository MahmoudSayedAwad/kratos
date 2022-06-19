import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kratos/domain/models/models.dart';
import 'package:kratos/domain/usecase/login_usecase.dart';

import 'login_states.dart';



class KratosLoginCubit extends Cubit<KratosLoginStates> {
  KratosLoginCubit(this._loginUseCase) : super(KratosLoginInitialState());

  static KratosLoginCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
  final LoginUseCase _loginUseCase;
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  User? user;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(KratosChangePasswordVisibilityState());
  }

  void userLogin({
    required String name,
    required String password,
  })async {
    emit(KratosLoginLoadingState());

    (await _loginUseCase.execute(
    LoginUseCaseInput(name, password)))
        .fold((failure) {
    // left -> failure
    emit(KratosLoginFailureState(failure));
    }, (data) {
    // left -> failure
     /* print(data.height);
      print(data.weight);
      print(data.workingHours);
      print(data.name);
      print(data.password);
      print(data.gender);
      print(data.id);*/


   emit(KratosLoginSuccessState(data));

    });


  }
}
