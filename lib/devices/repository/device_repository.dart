import 'package:defender/devices/api/api.dart';
import 'package:defender/devices/api/model/model.dart';

class DeviceRepository {
  final DevicesApi _deviceApi;

  const DeviceRepository({
    required DevicesApi deviceApi,
  }) : _deviceApi = deviceApi;

  Stream<List<Device>> devices() => _deviceApi.devices();

  Future<void> save(
    Device device,
  ) =>
      _deviceApi.save(device);

  Future<void> delete(
    String deviceId,
  ) =>
      _deviceApi.delete(deviceId);
}
