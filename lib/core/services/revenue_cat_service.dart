class RevenueCatService {
  bool _isPremiumMock = false;

  Future<void> init() async {}

  Future<bool> purchase() async {
    _isPremiumMock = true;
    return true;
  }

  Future<bool> restore() async {
    _isPremiumMock = true; // При восстановлении тоже устанавливаем premium
    return true; // Возвращаем true для имитации успешного восстановления
  }

  Future<bool> isPremium() async {
    return _isPremiumMock;
  }

  Future<String> getMetadataString(String key, String defaultValue) async {
    return defaultValue;
  }
}
