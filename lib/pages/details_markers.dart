import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';
import 'package:belib/database/commentBox.dart';

class DetailsMarker extends StatelessWidget {
  final Fields details;
  DetailsMarker(@required this.details);
  List<TableRow> rowInfos = [];
  List<TableRow> comments = [];

  void initComments(){
    comments.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
              child :Text(
                  "Test"
              )
          ),
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Center(
                child : Text(
                    "Commentaire sur la station Commentaire sur la station Commentaire sur la station Commentaire s ur la station Commentaire sur la station Commentaire sur la station Commentaire sur la station"
                )
            )
        ),
      ],
    ),
    );
  }

  void initRowInfos() {
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0), //apply padding to all four sides
            child: Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
          /*Center(
              child :Text(
                  "Address"
              )
          ),*/
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.adresseStation.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0), //apply padding to all four sides
            child: Text(
                "District",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.arrondissement.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0), //apply padding to all four sides
            child: Text(
                "Charge point status",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.statutPdc.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Numbers of charge points",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.nbrePdc.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Schedules",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child:Text(
                  this.details.horaires.toString()
              )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Handicapped access",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.accessibilitePmr.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
        children: <Widget>[
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                  "E/F plug",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  )
              ),
            )
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text((() {
                    if(this.details.priseTypeEf.toString()=="True")
                      return "Yes";
                    else
                      return "No";
                  })())
            ),
        ],
      ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "CHAdeMO plug",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text((() {
                  if(this.details.priseTypeChademo.toString()=="True")
                    return "Yes";
                  else
                    return "No";
                })())
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Two-wheeled vehicle",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text((() {
                  if(this.details.priseTypeChademo.toString()=="True")
                    return "Yes";
                  else
                    return "No";
                })())
        ),
      ],
    ),
    );

    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Nominal power",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text(
                    this.details.puissanceNominale.toString()+" kW"
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Operator",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Text(
                  this.details.nomOperateur.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Operator phone",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Text(
                    this.details.telephoneOperateur.toString()
                )
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Free",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Text((() {
                  if(this.details.gratuit.toString()=="true")
                    return "Yes";
                  else
                    return "No";
                })())
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "BC payment",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text((() {
                  if(this.details.paiementCb.toString()=="true")
                    return "Yes";
                  else
                    return "No";
                })())
        ),
      ],
    ),
    );
    rowInfos.add(TableRow(
      children: <Widget>[
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.top,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text(
                "Other payment",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                )
            ),
          )
        ),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child:Text((() {
                  if(this.details.paiementCb.toString()=="true")
                    return "Yes";
                  else
                    return "No";
                })())
        ),
      ],
    ),
    );
  }

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