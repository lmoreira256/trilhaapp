import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeyEnum {
  registrationDataNameKey,
  registrationDataDateOfBirthKey,
  registrationDateLevelOfExperience,
  registrationDatePreferredLanguages,
  registrationDateSalaryClaim,
  registrationDateTimeExperience,
  userName,
  height,
  receiveNotification,
  darkMode,
  randomNumber,
  numberClicks,
}

class AppStorageService {
  setRegistrationDataName(String value) async {
    _setString(StorageKeyEnum.registrationDataNameKey.toString(), value);
  }

  Future<String> getRegistrationDataName() async {
    return _getString(StorageKeyEnum.registrationDataNameKey.toString());
  }

  setRegistrationDataDateOfBirth(DateTime value) async {
    _setString(StorageKeyEnum.registrationDataDateOfBirthKey.toString(),
        value.toString());
  }

  Future<String> getRegistrationDataDateOfBirth() async {
    return _getString(StorageKeyEnum.registrationDataDateOfBirthKey.toString());
  }

  setRegistrationDataLevelOfExperience(String value) async {
    _setString(
        StorageKeyEnum.registrationDateLevelOfExperience.toString(), value);
  }

  Future<String> getRegistrationDataLevelOfExperience() async {
    return _getString(
        StorageKeyEnum.registrationDateLevelOfExperience.toString());
  }

  setRegistrationDataPreferredLanguages(List<String> values) async {
    _setStringList(
        StorageKeyEnum.registrationDatePreferredLanguages.toString(), values);
  }

  Future<List<String>> getRegistrationDataPreferredLanguages() async {
    return _getStringList(
        StorageKeyEnum.registrationDatePreferredLanguages.toString());
  }

  setRegistrationDataSalaryClaim(double value) async {
    _setDouble(StorageKeyEnum.registrationDateSalaryClaim.toString(), value);
  }

  Future<double> getRegistrationDataSalaryClaim() async {
    return _getDouble(StorageKeyEnum.registrationDateSalaryClaim.toString());
  }

  setRegistrationDataTimeExperience(int value) async {
    _setInt(StorageKeyEnum.registrationDateTimeExperience.toString(), value);
  }

  Future<int> getRegistrationTimeExperience() async {
    return _getInt(StorageKeyEnum.registrationDateTimeExperience.toString());
  }

  setUserName(String value) async {
    _setString(StorageKeyEnum.userName.toString(), value);
  }

  Future<String> getUserName() async {
    return _getString(StorageKeyEnum.userName.toString());
  }

  setHeight(double value) async {
    _setDouble(StorageKeyEnum.height.toString(), value);
  }

  Future<double> getHeigth() async {
    return _getDouble(StorageKeyEnum.userName.toString());
  }

  setReceiveNotification(bool value) async {
    _setBool(StorageKeyEnum.receiveNotification.toString(), value);
  }

  Future<bool> getReceiveNotification() async {
    return _getBool(StorageKeyEnum.receiveNotification.toString());
  }

  setDarkMode(bool value) async {
    _setBool(StorageKeyEnum.darkMode.toString(), value);
  }

  Future<bool> getDarkMode() async {
    return _getBool(StorageKeyEnum.darkMode.toString());
  }

  setRandomNumber(int value) async {
    _setInt(StorageKeyEnum.randomNumber.toString(), value);
  }

  Future<int> getRandomNumber() async {
    return _getInt(StorageKeyEnum.randomNumber.toString());
  }

  setNumberClicks(int value) async {
    _setInt(StorageKeyEnum.numberClicks.toString(), value);
  }

  Future<int> getNumberClicks() async {
    return _getInt(StorageKeyEnum.numberClicks.toString());
  }

  _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? '';
  }

  _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }
}
