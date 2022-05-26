import 'package:shared_preferences/shared_preferences.dart';

class Colormanger {
  late String primary;
  late String secondry;

  savemode(int mode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(mode == 1)pref.setString("mode1", "mode1");
    if(mode == 2)pref.setString("mode1", "mode2");
    if(mode == 3)pref.setString("mode1", "mode3");
  }
  uploadmode()
  {
    
  }
}
