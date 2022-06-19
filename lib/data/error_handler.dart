import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {

      if (error is StateError) {
        failure = DataSource.DEFAULT.getFailure();
      }else{
        failure=Failure(error.runtimeType.toString());
      }
//

  }
}



enum DataSource {
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {


      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure( ResponseMessage.DEFAULT);
    }
  }
}



class ResponseMessage {


  static const String NO_INTERNET_CONNECTION ="noInternetError";
  static const String DEFAULT = "please write password or user name correctly";

}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
