class Belib {
  Belib({
    required this.nhits,
    required this.parameters,
    required this.records,
    required this.facetGroups,
  });
  late final int nhits;
  late final Parameters parameters;
  late final List<Records> records;
  late final List<FacetGroups> facetGroups;

  Belib.fromJson(Map<String, dynamic> json){
    nhits = json['nhits'];
    parameters = Parameters.fromJson(json['parameters']);
    records = List.from(json['records']).map((e)=>Records.fromJson(e)).toList();
    facetGroups = List.from(json['facet_groups']).map((e)=>FacetGroups.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nhits'] = nhits;
    _data['parameters'] = parameters.toJson();
    _data['records'] = records.map((e)=>e.toJson()).toList();
    _data['facet_groups'] = facetGroups.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Parameters {
  Parameters({
    required this.dataset,
    required this.rows,
    required this.start,
    required this.facet,
    required this.format,
    required this.timezone,
  });
  late final String dataset;
  late final int rows;
  late final int start;
  late final List<String> facet;
  late final String format;
  late final String timezone;

  Parameters.fromJson(Map<String, dynamic> json){
    dataset = json['dataset'];
    rows = json['rows'];
    start = json['start'];
    facet = List.castFrom<dynamic, String>(json['facet']);
    format = json['format'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dataset'] = dataset;
    _data['rows'] = rows;
    _data['start'] = start;
    _data['facet'] = facet;
    _data['format'] = format;
    _data['timezone'] = timezone;
    return _data;
  }
}

class Records {
  Records({
    required this.datasetid,
    required this.recordid,
    required this.fields,
    required this.geometry,
    required this.recordTimestamp,
  });
  late final String datasetid;
  late final String recordid;
  late final Fields fields;
  late final Geometry geometry;
  late final String recordTimestamp;

  Records.fromJson(Map<String, dynamic> json){
    datasetid = json['datasetid'];
    recordid = json['recordid'];
    fields = Fields.fromJson(json['fields']);
    geometry = Geometry.fromJson(json['geometry']);
    recordTimestamp = json['record_timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['datasetid'] = datasetid;
    _data['recordid'] = recordid;
    _data['fields'] = fields.toJson();
    _data['geometry'] = geometry.toJson();
    _data['record_timestamp'] = recordTimestamp;
    return _data;
  }
}

class Fields {
  Fields({
    required this.adresseStation,
    required this.arrondissement,
    required this.urlDescriptionPdc,
    required this.statutPdc,
    required this.codeInseeCommune,
    required this.lastUpdated,
    required this.idPdc,
    required this.coordonneesxy,
  });
  late final String adresseStation;
  late final String arrondissement;
  late final String urlDescriptionPdc;
  late final String statutPdc;
  late final String codeInseeCommune;
  late final String lastUpdated;
  late final String idPdc;
  late final List<double> coordonneesxy;

  Fields.fromJson(Map<String, dynamic> json){
    adresseStation = json['adresse_station'];
    arrondissement = json['arrondissement'];
    urlDescriptionPdc = json['url_description_pdc'];
    statutPdc = json['statut_pdc'];
    codeInseeCommune = json['code_insee_commune'];
    lastUpdated = json['last_updated'];
    idPdc = json['id_pdc'];
    coordonneesxy = List.castFrom<dynamic, double>(json['coordonneesxy']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adresse_station'] = adresseStation;
    _data['arrondissement'] = arrondissement;
    _data['url_description_pdc'] = urlDescriptionPdc;
    _data['statut_pdc'] = statutPdc;
    _data['code_insee_commune'] = codeInseeCommune;
    _data['last_updated'] = lastUpdated;
    _data['id_pdc'] = idPdc;
    _data['coordonneesxy'] = coordonneesxy;
    return _data;
  }
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });
  late final String type;
  late final List<double> coordinates;

  Geometry.fromJson(Map<String, dynamic> json){
    type = json['type'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class FacetGroups {
  FacetGroups({
    required this.name,
    required this.facets,
  });
  late final String name;
  late final List<Facets> facets;

  FacetGroups.fromJson(Map<String, dynamic> json){
    name = json['name'];
    facets = List.from(json['facets']).map((e)=>Facets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['facets'] = facets.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Facets {
  Facets({
    required this.name,
    required this.count,
    required this.state,
    required this.path,
  });
  late final String name;
  late final int count;
  late final String state;
  late final String path;

  Facets.fromJson(Map<String, dynamic> json){
    name = json['name'];
    count = json['count'];
    state = json['state'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['count'] = count;
    _data['state'] = state;
    _data['path'] = path;
    return _data;
  }
}