class Example {
  int id;
  String name;
  bool isActive;

  Example({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      id: json["id"],
      name: json["name"],
      isActive: json["isActive"],
    );
  }
}
