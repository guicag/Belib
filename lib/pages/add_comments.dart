import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;

import '../providers/belib_api_provider.dart';
import '../providers/location_provider.dart';
import '../models/belib_model.dart';
import '../models/comment_model.dart';
import 'package:belib/database/commentBox.dart';

class AddComment extends StatelessWidget {
  final String idStation;
  String title = '';
  String text = '';
  final box = CommentBox.box;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  AddComment(@required this.idStation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Add comment')),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (String ?value) {
                        this.title = value!;
                      }
                  ),
                  TextFormField(
                      maxLines: 8,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Text'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (String ?value) {
                        this.text = value!;
                      }
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Color(0xFFA1B24E), fontSize: 16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        box.add(Comments(id: this.idStation, title: this.title, message: this.text));
                        Fluttertoast.showToast(
                          msg: "Comment added: " + title,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                        );
                        Navigator.pop(context);
                      }
                      //box.add(Comments(id: this.idStation, title: "test", message: "test"));
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
