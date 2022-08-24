import 'package:hive/hive.dart';
import '../../app_core/hive_keys.dart';

class HiveUtil {

  late Box authBox;

  HiveUtil(){
    authBox = Hive.box(HiveKeys.boxAuth.toString());
  }

  void put(String value) {
    authBox.put(HiveKeys.boxAuth.toString(), value);
  }

  dynamic get() {
    return authBox.get(HiveKeys.boxAuth.toString());
  }

  dynamic delete() {
    return authBox.delete(HiveKeys.boxAuth.toString());
  }
}