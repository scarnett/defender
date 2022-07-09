import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defender/devices/api/api.dart';
import 'package:defender/devices/api/model/model.dart';
import 'package:defender/devices/exceptions/device_exception.dart';
import 'package:rxdart/subjects.dart';

class DevicesFirebaseApi implements DevicesApi {
  final CollectionReference<Map<String, dynamic>> deviceCollection = FirebaseFirestore.instance.collection('devices');
  final BehaviorSubject<List<Device>> _deviceStreamController = BehaviorSubject<List<Device>>.seeded(const []);
  Device? device;

  DevicesFirebaseApi() {
    _init();
  }

  void _init() {
    deviceCollection.get().then(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        List<Device> devices = snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) => Device.fromJson(doc.data()))
            .toList();

        _deviceStreamController.add(devices);
        return devices;
      },
    );
  }

  @override
  Stream<List<Device>> devices() => _deviceStreamController.asBroadcastStream();

  @override
  Device? activeDevice() => device;

  @override
  Future<void> save(
    Device device,
  ) {
    final List<Device> devices = [..._deviceStreamController.value];
    final int deviceIndex = devices.indexWhere((Device device) => device.id == device.id);
    if (deviceIndex >= 0) {
      devices[deviceIndex] = device;
    } else {
      devices.add(device);
    }

    _deviceStreamController.add(devices);
    return deviceCollection.add(device.toJson());
  }

  @override
  Future<void> delete(
    String deviceId,
  ) async {
    final List<Device> devices = [..._deviceStreamController.value];
    final int deviceIndex = devices.indexWhere((Device device) => device.id == deviceId);
    if (deviceIndex == -1) {
      throw DeviceNotFoundException();
    }

    devices.removeAt(deviceIndex);
    _deviceStreamController.add(devices);
    return deviceCollection.doc(deviceId).delete();
  }
}
