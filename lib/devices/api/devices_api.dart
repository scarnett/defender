import 'package:defender/devices/api/model/model.dart';

abstract class DevicesApi {
  const DevicesApi();

  Stream<List<Device>> getTodos();
  Future<void> saveDevice(Device device);
  Future<void> deleteDevice(String id);
  Future<int> clearCompleted();
  Future<int> completeAll({
    required bool isCompleted,
  });
}
