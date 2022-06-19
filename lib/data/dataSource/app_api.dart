import 'package:kratos/data/dataSource/db_helper.dart';
import 'package:kratos/data/response/response.dart';

abstract class AppServiceClient {
  Future<UserResponse> login(String name, String password);
  Future<UserResponse> loginById(int id);

  Future<int> register(String name, String password, String workingHours,
      String gender, int weight, int height, String email, String phone, int age);
}

class AppServiceClientImpl implements AppServiceClient {
  final SqlDb _sqlDb;
  AppServiceClientImpl(this._sqlDb);
  @override
  Future<UserResponse> login(String name, String password) async {
    List<Map<String, Object?>> response =
        await _sqlDb.readData("SELECT * FROM user WHERE "
            "name = '$name' AND "
            "password = '$password'");
    return UserResponse.fromMap(response.first);
  }

  @override
  Future<int> register(
      String name,
      String password,
      String workingHours,
      String gender,
      int weight,
      int height,
      String email,
      String phone,
      int age) async {
    int response = await _sqlDb.insertData(
        'INSERT INTO user(name, password, workingHours,gender,weight,height,email,phone,age) VALUES("$name","$password","$workingHours","$gender",$weight,$height,"$email","$phone",$age )');
    return response;
  }

  @override
  Future<UserResponse> loginById(int id) async {
    List<Map<String, Object?>> response =
        await _sqlDb.readData("SELECT * FROM user WHERE "
            "id = '$id'");
    return UserResponse.fromMap(response.first);
  }
}
