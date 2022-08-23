import 'package:shared_preferences/shared_preferences.dart';

saveData(SharedPreferences saveDataConnect, int x) async {
  saveDataConnect = await SharedPreferences.getInstance();
  saveDataConnect.setInt('login', x);
}
