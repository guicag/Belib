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
      body: Column(
        children :  <Widget>[
          Image.asset(
              'assets/images/electric_car.png'
          ),
          Center(
              child :Text(
                  "Adresse"
              )
          ),
          Center(
              child :Text(
                  "Infos"
              )
          ),
          Table(
            //border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Center(
                      child :Text(
                          "Data"
                      )
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child:Center(
                        child :Text(
                            "Value"
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
              child :Text(
                  "Comments"
              )
          ),
        ]
      )
    );
  }
}