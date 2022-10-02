import 'package:defender/devices/api/model/model.dart';

abstract class DevicesApi {
  Stream<List<Device>> devices();

  DevicesApi();

  Future<void> save(
    Device device,
  );

  Future<void> delete(
    String deviceId,
  );
}
