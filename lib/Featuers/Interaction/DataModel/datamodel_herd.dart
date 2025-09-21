class DataModeleHerd {
  final String name;
  final int shaved;
  final double age;
  DataModeleHerd({required this.name, required this.age, required this.shaved});
  factory DataModeleHerd.fromjson(Map<String, dynamic> json) {
    return DataModeleHerd(
      name: json['name'],
      age: json['age'],
      shaved: json['age_last_shaved'],
    );
  }
}
