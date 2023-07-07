abstract class PersistentStorageRemoteDataSource{
  Future<bool> isDarkMode();
  Future<void> updateDarkMode(bool isDarkMode);
}