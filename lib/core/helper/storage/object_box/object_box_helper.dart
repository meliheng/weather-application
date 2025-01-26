import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:weatherapp/objectbox.g.dart';

class ObjectBoxHelper {
  static ObjectBoxHelper? _instance;
  Store? _store;

  ObjectBoxHelper._();

  static ObjectBoxHelper get instance {
    _instance ??= ObjectBoxHelper._();
    return _instance!;
  }

  Future<Store> get store async {
    if (_store == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      _store = await openStore(directory: p.join(docsDir.path, "weather-db"));
    }
    return _store!;
  }

  Future<void> closeStore() async {
    _store?.close();
    _store = null;
  }

  Future<void> saveData<T>(T data) async {
    final store = await this.store;
    final box = store.box<T>();
    box.put(data);
  }

  Future<List<T>> readData<T>() async {
    final store = await this.store;
    final box = store.box<T>();
    return box.getAll();
  }

  Future<void> clearData<T>() async {
    final store = await this.store;
    final box = store.box<T>();
    await box.removeAllAsync();
  }
}
