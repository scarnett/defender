import 'package:defender/devices/api/model/model.dart';

abstract class DevicesApi {
  const DevicesApi();

  Stream<List<Device>> devices();

  Future<void> save(
    Device device,
  );

  Future<void> delete(
    String deviceId,
  );
}
