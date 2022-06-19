import 'package:kratos/data/failure.dart';
import 'package:kratos/domain/models/models.dart';

abstract class KratosLoginStates {}

class KratosLoginInitialState extends KratosLoginStates {}

class KratosLoginLoadingState extends KratosLoginStates {}

class KratosLoginSuccessState extends KratosLoginStates {
  User user;
  KratosLoginSuccessState(this.user);
}

class KratosLoginErrorState extends KratosLoginStates {
  final String error;
  KratosLoginErrorState(this.error);
}

class KratosLoginFailureState extends KratosLoginStates {
  Failure? failure;
  KratosLoginFailureState(this.failure);
}

class KratosChangePasswordVisibilityState extends KratosLoginStates {}
