import 'package:http/http.dart' as http;
import '../models/belib_model.dart';
import 'dart:convert';

Future<Belib> fetchBelib() async {
  final response = await http.get(Uri.parse(
      'https://opendata.paris.fr/api/records/1.0/search/?dataset=belib-points-de-recharge-pour-vehicules-electriques-donnees-statiques&q=&rows=10000&facet=statut_pdc&facet=arrondissement&facet=code_insee_commune&facet=implantation_station&facet=nbre_pdc&facet=condition_acces&facet=gratuit&facet=paiement_acte&facet=paiement_cb&facet=paiement_autre&facet=reservation&facet=observations&facet=siren_amenageur&facet=date_mise_en_service&facet=accessibilite_pmr&facet=restriction_gabarit&facet=station_deux_roues&facet=puissance_nominale&facet=prise_type_ef&facet=prise_type_2&facet=prise_type_combo_ccs&facet=prise_type_chademo&facet=prise_type_autre&facet=prise_type_3&facet=horaires&facet=raccordement'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Belib.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
