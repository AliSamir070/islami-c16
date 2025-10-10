import 'package:islami_c16/core/resources/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SuraModel.dart';

class PrefsManager{
  static late SharedPreferences prefs;

  static init()async{
    prefs = await SharedPreferences.getInstance();
  }

  static saveMostRecently(List<SuraModel> mostRecently){
    prefs.setStringList("most recently", mostRecently.map((sura) => sura.suraNameEn).toList());
  }
  // ["Al-fatiha" - "Al-Baqarah"]
  static List<SuraModel> getMostRecently(){
    List<String> savedSuras = prefs.getStringList("most recently")??[];
    List<SuraModel> mostRecently = [];
    for(int i=0;i<savedSuras.length;i++){
      SuraModel foundSura = AppConstants.surasList.firstWhere((sura) =>sura.suraNameEn ==savedSuras[i]);
      mostRecently.add(foundSura);
    }
    return mostRecently;
  }

}