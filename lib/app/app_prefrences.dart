import 'package:kratos/domain/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    _sharedPreferences.remove("water");
    _sharedPreferences.remove("steps");
    _sharedPreferences.remove("sleeping");
    _sharedPreferences.remove("meals");

  }

  Future setUserLogged(User user) async {
    _sharedPreferences.setInt("id", user.id);
    _sharedPreferences.setInt("weight", user.weight);
    _sharedPreferences.setInt("height", user.height);
    _sharedPreferences.setInt("age", user.age);
    _sharedPreferences.setString("password", user.password);
    _sharedPreferences.setString("gender", user.gender);
    _sharedPreferences.setString("name", user.name);
    _sharedPreferences.setString("workingHours", user.workingHours);
    _sharedPreferences.setString("email", user.email);
    _sharedPreferences.setString("phone", user.phone);
  }

  User getUserLogged() {
    int id = _sharedPreferences.getInt("id") ?? 0;
    int weight = _sharedPreferences.getInt("weight") ?? 0;
    int height = _sharedPreferences.getInt("height") ?? 0;
    int age = _sharedPreferences.getInt("age") ?? 0;
    String password = _sharedPreferences.getString("password") ?? "";
    String gender = _sharedPreferences.getString("gender") ?? "";
    String name = _sharedPreferences.getString("name") ?? "";
    String workingHours = _sharedPreferences.getString("workingHours") ?? "";
    String email = _sharedPreferences.getString("email") ?? "";
    String phone = _sharedPreferences.getString("phone") ?? "";

    return User(
        password: password,
        name: name,
        id: id,
        workingHours: workingHours,
        gender: gender,
        weight: weight,
        height: height,
        email: email,
        phone: phone,
        age: age);
  }

  Future<void> setNum(String key, int num)  async {
    _sharedPreferences.setInt(key, num);
  }

  int getNum(String key)  {
    return _sharedPreferences.getInt(key)??0 ;

  }
}
