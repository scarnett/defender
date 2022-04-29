import 'package:defender/devices/api/api.dart';
import 'package:defender/devices/api/model/model.dart';

class DeviceRepository {
  final DevicesApi _deviceApi;

  const DeviceRepository({
    required DevicesApi deviceApi,
  }) : _deviceApi = deviceApi;

  Stream<List<Device>> getDevices() => _deviceApi.getDevices();

  Future<void> saveDevice(
    Device device,
  ) =>
      _deviceApi.saveDevice(device);

  Future<void> deleteDevice(
    String id,
  ) =>
      _deviceApi.deleteDevice(id);
}
