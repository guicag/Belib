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
  }
}