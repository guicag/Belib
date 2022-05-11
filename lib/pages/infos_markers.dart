import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showInfosDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Information', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green, size: 35),
                  Flexible(
                    child: Text('These are the highest rated electric charging stations in Paris.', style: TextStyle(fontSize: 15))
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.orange, size: 35),
                  Flexible(
                      child: Text('These are the electric charging that have an middle average in Paris.', style: TextStyle(fontSize: 15))
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 35),
                  Flexible(
                      child: Text('These are the lowest rated electric charging stations in Paris.', style: TextStyle(fontSize: 15))
                  )
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Understood'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
