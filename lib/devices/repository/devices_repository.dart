import 'package:defender/devices/api/api.dart';
import 'package:defender/devices/api/model/model.dart';

class DevicesRepository {
  final DevicesApi _deviceApi;

  const DevicesRepository({
    required DevicesApi devicesApi,
  }) : _deviceApi = devicesApi;

  Stream<List<Device>> devices() => _deviceApi.devices();
  Device? activeDevice() => _deviceApi.activeDevice();

  Future<void> save(
    Device device,
  ) =>
      _deviceApi.save(device);

  Future<void> delete(
    String deviceId,
  ) =>
      _deviceApi.delete(deviceId);
}
