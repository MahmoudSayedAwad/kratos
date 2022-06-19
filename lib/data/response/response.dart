
class UserResponse {
  String? name, password,  workingHours, gender,email,phone;
  int? weight, height,id,age;

  UserResponse({
    required this.password,
    required this.name,
    required this.id,

    required this.workingHours,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age

  });
  UserResponse.fromMap(Map<String, dynamic> data) {
    password = data['password'];
    name = data['name'];
    id = data['id'];

    workingHours = data['workingHours'];
    gender = data['gender'];
    weight = data['weight'];
    height = data['height'];
    email=data['email'];
    phone=data['phone'];
    age=data['age'];
  }

  Map<String, dynamic> toMap() => {
    'password': password,
    'name': name,
    'id': id,
    'workingHours': workingHours,
    'gender': gender,
    'weight': weight,
    'height': height,
    'email':email,
    'phone':phone,
    'age':age
  };
}
class RecommendationsResponse{
  String? walkingHour,sleepingHour,snacks,water,meals,trainingType;

  RecommendationsResponse(this.walkingHour, this.sleepingHour, this.snacks, this.water,
      this.meals, this.trainingType);
  RecommendationsResponse.fromMap(Map<String, dynamic> data) {
    walkingHour = data['walkingHour'];
    sleepingHour = data['sleepingHour'];
    snacks = data['snacks'];
    water = data['water'];
    meals = data['meals'];
    trainingType = data['trainingType'];

  }
  Map<String, dynamic> toMap() => {
    'walkingHour': walkingHour,
    'sleepingHour': sleepingHour,
    'snacks': snacks,
    'water': water,
    'meals': meals,
    'trainingType': trainingType,

  };

}
class TrackingResponse{
  String? steps,water,calories,weight,sleep;
  int? trackingId;

  TrackingResponse(this.steps, this.water, this.calories, this.weight, this.sleep,
      this.trackingId);
  TrackingResponse.fromMap(Map<String, dynamic> data) {
    steps = data['steps'];
    water = data['water'];
    calories = data['calories'];
    weight = data['weight'];
    sleep = data['sleep'];
    trackingId = data['trackingId'];

  }
  Map<String, dynamic> toMap() => {
    'steps': steps,
    'calories': calories,
    'weight': weight,
    'water': water,
    'sleep': sleep,
    'trackingId': trackingId,

  };
}
