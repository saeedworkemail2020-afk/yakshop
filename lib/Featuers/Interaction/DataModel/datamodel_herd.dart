class ServiceHerd {
  final String name;
  final int shaved;
  final double age;
  ServiceHerd({required this.name, required this.age, required this.shaved});
  factory ServiceHerd.fromjson(Map<String, dynamic> json) {
    return ServiceHerd(
      name: json['name'],
      age: json['age'],
      shaved: json['age_last_shaved'],
    );
  }
}
