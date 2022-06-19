import 'package:kratos/domain/models/models.dart';

abstract class KratosRegisterStates {}

class KratosRegisterInitialState extends KratosRegisterStates {}

class KratosRegisterLoadingState extends KratosRegisterStates {}

class KratosRegisterSuccessState extends KratosRegisterStates {}

class KratosRegisterErrorState extends KratosRegisterStates {
  final String error;

  KratosRegisterErrorState(this.error);
}

class KratosLoginByIDLoadingState extends KratosRegisterStates {}

class KratosLoginByIDSuccessState extends KratosRegisterStates {
  User user;
  KratosLoginByIDSuccessState(this.user);
}

class KratosLoginByIDErrorState extends KratosRegisterStates {
  final String error;

  KratosLoginByIDErrorState(this.error);
}

class KratosRegisterChangePasswordVisibilityState extends KratosRegisterStates {
}
