import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';

class AddComment extends StatelessWidget {
  final String recordid;
  String? _title;
  String? _text;

  AddComment(@required this.recordid);

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      onSaved: (String? value) {
        this._title = value;
      },
    );
  }

  Widget _buildText() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Text'),
      maxLines : 8,
      onSaved: (String? value) {
        this._text = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Add comment')),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTitle(),
                  _buildText(),
                  SizedBox(height: 100),
                  ElevatedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Color(0xFFA1B24E), fontSize: 16),
                    ),
                    onPressed: () {
                      return;
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
