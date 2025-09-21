class FoodModel {
  final String image;
  final String foodName;
  final String description;
  final double rate;
  final String time;

  FoodModel({
    required this.image,
    required this.foodName,
    required this.rate,
    required this.description,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      "foodName": foodName,
      'description': description,
      'rate': rate,
      'time': time,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      image: map['image'],
      foodName: map['foodName'],
      rate: map['rate'],
      description: map['description'],
      time: map['time'],
    );
  }
}
