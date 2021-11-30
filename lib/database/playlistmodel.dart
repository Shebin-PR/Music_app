import 'package:hive/hive.dart';

part 'playlistmodel.g.dart';

@HiveType(typeId: 1)
class PlayListModel extends HiveObject {
  @HiveField(1)
  dynamic playlist;

  PlayListModel({required this.playlist});
}




