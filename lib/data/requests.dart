class LoginRequest {
  String name;
  String password;

  LoginRequest(this.name, this.password);
}
class RegisterRequest {
  String name;
  String workingHours;
  String gender;
  int weight;
  String password;
  int height;
  String email;
  String phone;
  int age;

  RegisterRequest(this.name, this.workingHours, this.weight,
      this.gender, this.password, this.height,this.email,this.phone,this.age);
}
