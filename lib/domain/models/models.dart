
class User {
  String name, password,  workingHours, gender,email,phone;
  int weight, height,id,age;

  User({
    required this.password,
    required this.name,
    required this.id,

    required this.workingHours,
    required this.gender,
    required this.weight,
    required this.height,
    required this.email,
    required this.phone,required this.age
  });

}
class Recommendations{
  String walkingHour,sleepingHour,snacks,water,meals,trainingType;

  Recommendations(this.walkingHour, this.sleepingHour, this.snacks, this.water,
      this.meals, this.trainingType);


}
class Tracking{
  String steps,water,calories,weight,sleep;
  int trackingId;

  Tracking(this.steps, this.water, this.calories, this.weight, this.sleep,
      this.trackingId);
}
class Meal
{String img;
String mealName;

Meal(this.img, this.mealName);
}
