import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/comment_model.dart';

class CommentBox {
  static final CommentBox instance = CommentBox();
  static Box box = "" as Box;

  static init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(CommentsAdapter());
    box = await Hive.openBox("commentBox");

    /*var values = box.values;
    if (values.isEmpty) {
      box.putAll(Map.fromIterable(commentsList, key: (e) => e.key(), value: (e) => e));
    }*/
  }

  static void addComment(String id, String title, String message) {
    box.add(Comments(id: id, title: title, message: message));
  }

  /*static List<Comments> getComments(String id) {
    List<Comments> res = [];
    for (int i = 0; i < commentsList.length; i++) {
      if (commentsList[i].id == id) {
        res.add(commentsList[i]);
      }
    }
    return res;
  }*/

  static final List<Comments> commentsList = [];
}