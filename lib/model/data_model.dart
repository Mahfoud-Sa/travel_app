class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String decoration;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.decoration,
    required this.location,
  });

  factory DataModel.fromjson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        img: json['img'],
        price: json['price'],
        people: json['people'],
        stars: json['stars'],
        decoration: json['decoration'],
        location: json['location']);
  }
}
