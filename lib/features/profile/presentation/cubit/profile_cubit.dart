import 'package:amilingue/features/profile/domain/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsSwitchCubit extends Cubit<bool>{
  SettingsSwitchCubit(bool state) : super(state);
  void changeDarkMode(bool isDark) => emit(isDark);
}

class SettingsLogoutCubit extends Cubit<void>{
  SettingsLogoutCubit() : super(null);
  void logout()async{
    emit(null);
  }
}

class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit(this.persistentStorageRepository) : super(false);
  bool _isDark = false;
  bool get isDark => _isDark;
  final PersistentStorageRepository persistentStorageRepository;

  Future<void>init() async{
    _isDark = await persistentStorageRepository.isDarkMode();
    emit(_isDark);
  }
  Future<void>updateTheme(bool isDarkMode) async{
    //update theme
    _isDark = isDarkMode;
    await persistentStorageRepository.updateDarkMode(isDarkMode);
    emit(_isDark);
  }
}