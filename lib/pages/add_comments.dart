import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';
import '../models/comment_model.dart';
import 'package:belib/database/commentBox.dart';

class AddComment extends StatelessWidget {
  final String idStation;
  String? _title;
  String? _text;
  final box = CommentBox.box;
  //final _formKey = GlobalKey<FormState>();

  AddComment(@required this.idStation);

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      /*validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },*/
      onSaved: (String? value) {
        this._title = value;
      },
    );
  }

  Widget _buildText() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Text'),
      maxLines : 8,
      /*validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },*/
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
              //key: _formKey,
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
                      /*if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print('valid');
                        box.add(Comments(id: this.idStation, title: this._title.toString(), message: this._text.toString()));
                      }*/
                      box.add(Comments(id: this.idStation, title: "test", message: "test"));
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
