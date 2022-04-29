import 'package:defender/devices/api/api.dart';
import 'package:defender/devices/api/model/model.dart';

class DeviceRepository {
  final DevicesApi _deviceApi;

  const DeviceRepository({
    required DevicesApi deviceApi,
  }) : _deviceApi = deviceApi;

  Stream<List<Device>> getTodos() => _deviceApi.getDevices();
  Future<void> saveTodo(
    Device device,
  ) =>
      _deviceApi.saveDevice(device);

  Future<void> deleteTodo(
    String id,
  ) =>
      _deviceApi.deleteDevice(id);

  Future<int> clearCompleted() => _deviceApi.clearCompleted();
  Future<int> completeAll({
    required bool isCompleted,
  }) =>
      _deviceApi.completeAll(isCompleted: isCompleted);
}
