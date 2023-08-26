class Marketresponse {
  int id;
  String name;
  double? latitude;
  double? longitude;

  Marketresponse({
    required this.id,
    required this.name,
    this.latitude,
    this.longitude,
  });

  factory Marketresponse.fromJson(Map<String, dynamic> json) {
    return Marketresponse(
      id: json['Id'],
      name: json['Name'],
      latitude: json['Latitude'],
      longitude: json['Longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Latitude': latitude,
      'Longitude': longitude,
    };
  }
}
