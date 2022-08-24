class Plant {
  String? id;
  String? name;
  String? description;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.id,
        this.name,
        this.description,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}