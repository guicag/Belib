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

  final box = CommentBox.box;

  void initComments(){
    for (int i = 0; i < box.length; i++) {
      if (details.idPdcLocal == box.getAt(i).id) {
        comments.add(TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Center(
                  child :Text(
                      box.getAt(i).title
                  )
              ),
            ),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child:Center(
                    child : Text(
                        box.getAt(i).message
                    )
                )
            ),
          ],
        ),
        );
      }
    }
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
    if(rowInfos.isEmpty){
      initRowInfos();
    }
    if(comments.isEmpty){
      initComments();
    }
    return Scaffold (
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Details')),
        body: SingleChildScrollView(
            child: Column(
                children :  <Widget>[
                  Image.asset(
                      'assets/images/electric_car.png'
                  ),
                  Center(
                      child :Text(
                        this.details.nomStation.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  Center(
                      child :Text(
                        "Information",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  Table(
                    //border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: rowInfos
                  ),
                  SizedBox(height: 20),
                  Center(
                      child :Text(
                        "Comments",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  Table(
                    //border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(7),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: comments
                  ),
                ]
            )
        )
    );
  }
}