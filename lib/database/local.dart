import 'package:hive/hive.dart';

import 'datamodel.dart';

class Boxes {
  static Box<List<AllSongs>> getSongsDb() =>
      Hive.box<List<AllSongs>>("songdata");
}
