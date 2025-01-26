import 'package:weatherapp/core/helper/storage/object_box/object_box_helper.dart';
import 'package:weatherapp/core/models/user_location_model.dart';

class UserLocationStorageHelper {
  static Future<String> getCity() async {
    final locations =
        await ObjectBoxHelper.instance.readData<UserLocationModel>();
    return locations.firstOrNull?.city ?? "Los Angeles";
  }

  static Future<void> saveCity(String city) async {
    await ObjectBoxHelper.instance.clearData<UserLocationModel>();
    await ObjectBoxHelper.instance.saveData<UserLocationModel>(
      UserLocationModel(city: city),
    );
  }
}
