class LocationModel {
  String? country;
  String? city;
  double? latitude;
  double? longitude;

  LocationModel({
    this.country,
    this.city,
    this.latitude,
    this.longitude,
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['country'] = country;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
