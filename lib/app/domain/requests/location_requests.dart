class LocationRequest {
  double? lat;
  double? lon;
  String? lang;
  int? limit;
  String? appid;

  LocationRequest({
    this.lat,
    this.lon,
    this.lang,
    this.limit,
    this.appid,
  });

  LocationRequest.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    lang = json['lang'];
    limit = json['limit'];
    appid = json['appid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['lang'] = lang;
    data['limit'] = limit;
    data['appid'] = appid;
    return data;
  }
}