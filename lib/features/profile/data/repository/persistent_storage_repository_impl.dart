import 'package:amilingue/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:amilingue/features/profile/domain/repository/repositories.dart';

class PersistentStorageRepositoryImpl implements PersistentStorageRepository{
  final PersistentStorageRemoteDataSource persistentStorageRemoteDataSource;
  PersistentStorageRepositoryImpl({required this.persistentStorageRemoteDataSource});

  @override
  Future<bool> isDarkMode() async {
    return await persistentStorageRemoteDataSource.isDarkMode();
  }

  @override
  Future<void> updateDarkMode(bool isDarkMode) async {
    return await persistentStorageRemoteDataSource.updateDarkMode(isDarkMode);
  }


}