import 'package:hive/hive.dart';

part 'comment_model.g.dart';

@HiveType(typeId: 0)
class Comments {
  @HiveField(0, defaultValue: "0")
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String message;

  Comments({required this.id, required this.title, required this.message});

  String key() => title.hashCode.toString();
}