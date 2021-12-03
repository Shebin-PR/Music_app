import 'package:hive/hive.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 0)
class AllSongs extends HiveObject {
  @HiveField(1)
  String path;

  @HiveField(2)
  int? id;

  @HiveField(3)
  String? title;

  @HiveField(4)
  int? duration;

  @HiveField(5)
  String? artist;

  @HiveField(6)
  dynamic playlist;

  AllSongs({
    required this.path,
    required this.id,
    required this.title,
    required this.duration,
    required this.artist,
  });
}
