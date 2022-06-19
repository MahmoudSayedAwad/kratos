
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kratos/domain/usecase/register_usecase.dart';
import 'package:kratos/presentation/register/bloc/states.dart';




class KratosRegisterCubit extends Cubit<KratosRegisterStates> {
  KratosRegisterCubit(this._registerUseCase) : super(KratosRegisterInitialState());

  static KratosRegisterCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  bool isMale=true;

  //late ShopLoginModel loginModel;
  final RegisterUseCase _registerUseCase;
  //final LoginUseCase loginUseCase=LoginUseCase(RepositoryImpl(LocalDataSourceImpl(AppServiceClientImpl(SqlDb()))));

  void userRegister({
    required String name,
    required String password,
    required String gender,
    required String workingHours,
    required int weight,
    required int height,
    required String email,
    required String phone,
    required int age

  })
 async {
    emit(KratosRegisterLoadingState());
    (await _registerUseCase.execute(RegisterUseCaseInput(name,password,workingHours,gender,weight,height,email,phone,age))).fold(
            (failure)  {
          // left -> failure
            emit(KratosRegisterErrorState(failure.toString()));
        }, (data) {
      // right -> data (success)
      // content
      if (kDebugMode) {
        print(data.toString());
      }
     emit(KratosRegisterSuccessState());
      // navigate to main screen
      userLoginById(id: data);
      // isUserLoggedInSuccessfullyStreamController.add(true);
    }

    );

  }
  void userLoginById({
    required int id,


  })
  async {
    emit(KratosLoginByIDLoadingState());
    (await _registerUseCase.loginById(id)).fold(
            (failure)  {
          // left -> failure
          emit(KratosRegisterErrorState(failure.toString()));
        }, (data) {
      // right -> data (success)
      // content
      if (kDebugMode) {
        print(data.toString());
      }
      emit(KratosLoginByIDSuccessState(data));
      // navigate to main screen
      // isUserLoggedInSuccessfullyStreamController.add(true);
    }

    );


  }


  void changeGender()
  {
    isMale = !isMale;


    emit(KratosRegisterChangePasswordVisibilityState());
  }

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(KratosRegisterChangePasswordVisibilityState());
  }
  bool switchButton=true;
  void changeSwitchButton(value){
    switchButton=value;
    emit(KratosRegisterChangePasswordVisibilityState());
  }

}