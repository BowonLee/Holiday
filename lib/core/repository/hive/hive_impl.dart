import 'package:hive/hive.dart';

abstract class AbstractHiveService<T> {
  late Box<T> box;

  /// open box in constructor must be initialize
  abstract final String boxName;

  AbstractHiveService() {
    _setBox();
  }

  /// open box and set class attribute
  Future<void> _setBox() async {
    box = Hive.box<T>(boxName);
  }
}

abstract class HiveListDataService<T> extends AbstractHiveService<T> {
  List<T> getList() {
    return box.values.toList();
  }

  /// clear and set
  Future<void> setList(List<T> list) {
    box.clear();
    return box.addAll(list);
  }

  Future<void> addList(List<T> list) {
    return box.addAll(list);
  }
}
