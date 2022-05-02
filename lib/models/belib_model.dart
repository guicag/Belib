class Belib {
  int? nhits;
  Parameters? parameters;
  List<Records>? records;
  List<FacetGroups>? facetGroups;

  Belib({this.nhits, this.parameters, this.records, this.facetGroups});

  Belib.fromJson(Map<String, dynamic> json) {
    nhits = json['nhits'];
    parameters = json['parameters'] != null
        ? new Parameters.fromJson(json['parameters'])
        : null;
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    if (json['facet_groups'] != null) {
      facetGroups = <FacetGroups>[];
      json['facet_groups'].forEach((v) {
        facetGroups!.add(new FacetGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nhits'] = this.nhits;
    if (this.parameters != null) {
      data['parameters'] = this.parameters!.toJson();
    }
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    if (this.facetGroups != null) {
      data['facet_groups'] = this.facetGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parameters {
  String? dataset;
  int? rows;
  int? start;
  List<String>? facet;
  String? format;
  String? timezone;

  Parameters(
      {this.dataset,
      this.rows,
      this.start,
      this.facet,
      this.format,
      this.timezone});

  Parameters.fromJson(Map<String, dynamic> json) {
    dataset = json['dataset'];
    rows = json['rows'];
    start = json['start'];
    facet = json['facet'].cast<String>();
    format = json['format'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataset'] = this.dataset;
    data['rows'] = this.rows;
    data['start'] = this.start;
    data['facet'] = this.facet;
    data['format'] = this.format;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Records {
  String? datasetid;
  String? recordid;
  Fields? fields;
  Geometry? geometry;

  Records({this.datasetid, this.recordid, this.fields, this.geometry});

  Records.fromJson(Map<String, dynamic> json) {
    datasetid = json['datasetid'];
    recordid = json['recordid'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datasetid'] = this.datasetid;
    data['recordid'] = this.recordid;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

class Fields {
  String? priseTypeEf;
  String? priseTypeChademo;
  String? contactOperateur;
  String? idStationItinerance;
  String? adresseStation;
  String? nbrePdc;
  String? priseType2;
  String? restrictionGabarit;
  String? statutPdc;
  String? sirenAmenageur;
  String? codeInseeCommune;
  String? priseTypeComboCcs;
  String? priseType3;
  String? nomEnseigne;
  String? arrondissement;
  String? accessibilitePmr;
  String? numPdl;
  String? tarification;
  String? horaires;
  String? implantationStation;
  String? nomStation;
  String? reservation;
  String? observations;
  String? dateMaj;
  String? dateMiseEnService;
  String? idPdcLocal;
  String? nomAmenageur;
  String? nomOperateur;
  String? gratuit;
  String? telephoneOperateur;
  String? idPdcItinerance;
  String? puissanceNominale;
  String? contactAmenageur;
  String? paiementCb;
  String? conditionAcces;
  String? priseTypeAutre;
  String? paiementActe;
  String? stationDeuxRoues;
  String? idStationLocal;
  String? paiementAutre;
  String? raccordement;
  List<double>? coordonneesxy;

  Fields(
      {this.priseTypeEf,
      this.priseTypeChademo,
      this.contactOperateur,
      this.idStationItinerance,
      this.adresseStation,
      this.nbrePdc,
      this.priseType2,
      this.restrictionGabarit,
      this.statutPdc,
      this.sirenAmenageur,
      this.codeInseeCommune,
      this.priseTypeComboCcs,
      this.priseType3,
      this.nomEnseigne,
      this.arrondissement,
      this.accessibilitePmr,
      this.numPdl,
      this.tarification,
      this.horaires,
      this.implantationStation,
      this.nomStation,
      this.reservation,
      this.observations,
      this.dateMaj,
      this.dateMiseEnService,
      this.idPdcLocal,
      this.nomAmenageur,
      this.nomOperateur,
      this.gratuit,
      this.telephoneOperateur,
      this.idPdcItinerance,
      this.puissanceNominale,
      this.contactAmenageur,
      this.paiementCb,
      this.conditionAcces,
      this.priseTypeAutre,
      this.paiementActe,
      this.stationDeuxRoues,
      this.idStationLocal,
      this.paiementAutre,
      this.raccordement,
      this.coordonneesxy});

  Fields.fromJson(Map<String, dynamic> json) {
    priseTypeEf = json['prise_type_ef'];
    priseTypeChademo = json['prise_type_chademo'];
    contactOperateur = json['contact_operateur'];
    idStationItinerance = json['id_station_itinerance'];
    adresseStation = json['adresse_station'];
    nbrePdc = json['nbre_pdc'];
    priseType2 = json['prise_type_2'];
    restrictionGabarit = json['restriction_gabarit'];
    statutPdc = json['statut_pdc'];
    sirenAmenageur = json['siren_amenageur'];
    codeInseeCommune = json['code_insee_commune'];
    priseTypeComboCcs = json['prise_type_combo_ccs'];
    priseType3 = json['prise_type_3'];
    nomEnseigne = json['nom_enseigne'];
    arrondissement = json['arrondissement'];
    accessibilitePmr = json['accessibilite_pmr'];
    numPdl = json['num_pdl'];
    tarification = json['tarification'];
    horaires = json['horaires'];
    implantationStation = json['implantation_station'];
    nomStation = json['nom_station'];
    reservation = json['reservation'];
    observations = json['observations'];
    dateMaj = json['date_maj'];
    dateMiseEnService = json['date_mise_en_service'];
    idPdcLocal = json['id_pdc_local'];
    nomAmenageur = json['nom_amenageur'];
    nomOperateur = json['nom_operateur'];
    gratuit = json['gratuit'];
    telephoneOperateur = json['telephone_operateur'];
    idPdcItinerance = json['id_pdc_itinerance'];
    puissanceNominale = json['puissance_nominale'];
    contactAmenageur = json['contact_amenageur'];
    paiementCb = json['paiement_cb'];
    conditionAcces = json['condition_acces'];
    priseTypeAutre = json['prise_type_autre'];
    paiementActe = json['paiement_acte'];
    stationDeuxRoues = json['station_deux_roues'];
    idStationLocal = json['id_station_local'];
    paiementAutre = json['paiement_autre'];
    raccordement = json['raccordement'];
    coordonneesxy = json['coordonneesxy'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prise_type_ef'] = this.priseTypeEf;
    data['prise_type_chademo'] = this.priseTypeChademo;
    data['contact_operateur'] = this.contactOperateur;
    data['id_station_itinerance'] = this.idStationItinerance;
    data['adresse_station'] = this.adresseStation;
    data['nbre_pdc'] = this.nbrePdc;
    data['prise_type_2'] = this.priseType2;
    data['restriction_gabarit'] = this.restrictionGabarit;
    data['statut_pdc'] = this.statutPdc;
    data['siren_amenageur'] = this.sirenAmenageur;
    data['code_insee_commune'] = this.codeInseeCommune;
    data['prise_type_combo_ccs'] = this.priseTypeComboCcs;
    data['prise_type_3'] = this.priseType3;
    data['nom_enseigne'] = this.nomEnseigne;
    data['arrondissement'] = this.arrondissement;
    data['accessibilite_pmr'] = this.accessibilitePmr;
    data['num_pdl'] = this.numPdl;
    data['tarification'] = this.tarification;
    data['horaires'] = this.horaires;
    data['implantation_station'] = this.implantationStation;
    data['nom_station'] = this.nomStation;
    data['reservation'] = this.reservation;
    data['observations'] = this.observations;
    data['date_maj'] = this.dateMaj;
    data['date_mise_en_service'] = this.dateMiseEnService;
    data['id_pdc_local'] = this.idPdcLocal;
    data['nom_amenageur'] = this.nomAmenageur;
    data['nom_operateur'] = this.nomOperateur;
    data['gratuit'] = this.gratuit;
    data['telephone_operateur'] = this.telephoneOperateur;
    data['id_pdc_itinerance'] = this.idPdcItinerance;
    data['puissance_nominale'] = this.puissanceNominale;
    data['contact_amenageur'] = this.contactAmenageur;
    data['paiement_cb'] = this.paiementCb;
    data['condition_acces'] = this.conditionAcces;
    data['prise_type_autre'] = this.priseTypeAutre;
    data['paiement_acte'] = this.paiementActe;
    data['station_deux_roues'] = this.stationDeuxRoues;
    data['id_station_local'] = this.idStationLocal;
    data['paiement_autre'] = this.paiementAutre;
    data['raccordement'] = this.raccordement;
    data['coordonneesxy'] = this.coordonneesxy;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class FacetGroups {
  String? name;
  List<Facets>? facets;

  FacetGroups({this.name, this.facets});

  FacetGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['facets'] != null) {
      facets = <Facets>[];
      json['facets'].forEach((v) {
        facets!.add(new Facets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.facets != null) {
      data['facets'] = this.facets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facets {
  String? name;
  int? count;
  String? state;
  String? path;

  Facets({this.name, this.count, this.state, this.path});

  Facets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
    state = json['state'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['count'] = this.count;
    data['state'] = this.state;
    data['path'] = this.path;
    return data;
  }
}
