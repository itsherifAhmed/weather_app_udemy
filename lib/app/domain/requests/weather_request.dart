class WeatherRequest {
  double? lat;
  double? lon;
  String? lang;
  String? appid;

  WeatherRequest({
    this.lat,
    this.lon,
    this.lang,
    this.appid,
  });

  WeatherRequest.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    lang = json['lang'];
    appid = json['appid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['lang'] = lang;
    data['appid'] = appid;
    return data;
  }
}
