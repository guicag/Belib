import 'package:http/http.dart' as http;
import '../models/belib_model.dart';
import 'dart:convert';

Future<Belib> fetchBelib() async {
  final response = await http
      .get(Uri.parse('https://opendata.paris.fr/api/records/1.0/search/?dataset=belib-points-de-recharge-pour-vehicules-electriques-disponibilite-temps-reel&q=&facet=statut_pdc&facet=last_updated&facet=arrondissement'));

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