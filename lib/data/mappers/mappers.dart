import 'package:kratos/app/extensions.dart';
import 'package:kratos/data/response/response.dart';
import 'package:kratos/domain/models/models.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
      gender: this?.gender.orEmpty() ?? "",
      password: this?.password.orEmpty() ?? '',
      workingHours: this?.workingHours.orEmpty() ?? " ",
      name: this?.name.orEmpty() ?? '',
      id: this?.id.orZero() ?? 0,
      weight: this?.weight?.orZero() ?? 0,
      height: this?.height?.orZero() ?? 0,
      email: this?.email?.orEmpty()??"",
      phone: this?.phone?.orEmpty()??"",
      age: this?.age?.orZero() ?? 0,

    );
  }
}
