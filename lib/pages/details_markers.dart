import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';

class DetailsMarker extends StatelessWidget {
  final Fields details;
  DetailsMarker(@required this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Container(
        child: Image.asset(
          'assets/images/electric_car.png'
        )
      ),
    );
  }
}