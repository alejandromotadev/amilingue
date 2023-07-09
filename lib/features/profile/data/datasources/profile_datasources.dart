import 'package:amilingue/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorageDataSourcesImpl extends PersistentStorageRemoteDataSource{
  static const _isDarkModePref = "isDarkMode";
  @override
  Future<bool> isDarkMode() async{
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(_isDarkModePref) ?? false;
  }

  @override
  Future<void> updateDarkMode(bool isDarkMode) async{
    final preference = await SharedPreferences.getInstance();
    preference.setBool(_isDarkModePref, isDarkMode);
  }
}