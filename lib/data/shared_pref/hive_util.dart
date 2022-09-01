import 'package:hive/hive.dart';
import '../../app_core/hive_keys.dart';

class HiveUtil {

  late Box globalBox;

  HiveUtil(){
    globalBox = Hive.box(GLOBAL_DATA_BOX);
  }

///-----------------------------------------------------------------------------/ Auth

  void putAuth(String value) {
    globalBox.put(AUTH_KEY, value);
  }

  dynamic getAuth() {
    return globalBox.get(AUTH_KEY);
  }

  dynamic deleteAuth() {
    return globalBox.delete(AUTH_KEY);
  }

/// ----------------------------------------------------------------------------/ User Id

  void putUserId(String value) {
    globalBox.put(USER_ID_KEY, value);
  }

  dynamic getUserId() {
    return globalBox.get(USER_ID_KEY);
  }
}