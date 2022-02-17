class Menu {
  int id;
  String name;

  Menu({
    required this.id,
    required this.name,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json["id"],
      name: json["name"],
    );
  }
}
