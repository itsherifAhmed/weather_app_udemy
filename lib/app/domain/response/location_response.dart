class LocationResponse {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LocationResponse({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  LocationResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null
        ? LocalNames.fromJson(json['local_names'])
        : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames!.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}

class LocalNames {
  String? pl;
  String? en;
  String? zh;
  String? it;
  String? de;
  String? he;
  String? cs;
  String? lt;
  String? ru;
  String? sr;
  String? hu;
  String? ro;
  String? tr;
  String? uk;
  String? et;
  String? ml;
  String? hr;
  String? ar;
  String? ku;
  String? eo;
  String? nl;
  String? fr;
  String? la;
  String? be;
  String? es;
  String? os;
  String? ko;

  LocalNames({
    this.pl,
    this.en,
    this.zh,
    this.it,
    this.de,
    this.he,
    this.cs,
    this.lt,
    this.ru,
    this.sr,
    this.hu,
    this.ro,
    this.tr,
    this.uk,
    this.et,
    this.ml,
    this.hr,
    this.ar,
    this.ku,
    this.eo,
    this.nl,
    this.fr,
    this.la,
    this.be,
    this.es,
    this.os,
    this.ko,
  });

  LocalNames.fromJson(Map<String, dynamic> json) {
    pl = json['pl'];
    en = json['en'];
    zh = json['zh'];
    it = json['it'];
    de = json['de'];
    he = json['he'];
    cs = json['cs'];
    lt = json['lt'];
    ru = json['ru'];
    sr = json['sr'];
    hu = json['hu'];
    ro = json['ro'];
    tr = json['tr'];
    uk = json['uk'];
    et = json['et'];
    ml = json['ml'];
    hr = json['hr'];
    ar = json['ar'];
    ku = json['ku'];
    eo = json['eo'];
    nl = json['nl'];
    fr = json['fr'];
    la = json['la'];
    be = json['be'];
    es = json['es'];
    os = json['os'];
    ko = json['ko'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pl'] = pl;
    data['en'] = en;
    data['zh'] = zh;
    data['it'] = it;
    data['de'] = de;
    data['he'] = he;
    data['cs'] = cs;
    data['lt'] = lt;
    data['ru'] = ru;
    data['sr'] = sr;
    data['hu'] = hu;
    data['ro'] = ro;
    data['tr'] = tr;
    data['uk'] = uk;
    data['et'] = et;
    data['ml'] = ml;
    data['hr'] = hr;
    data['ar'] = ar;
    data['ku'] = ku;
    data['eo'] = eo;
    data['nl'] = nl;
    data['fr'] = fr;
    data['la'] = la;
    data['be'] = be;
    data['es'] = es;
    data['os'] = os;
    data['ko'] = ko;
    return data;
  }
}
