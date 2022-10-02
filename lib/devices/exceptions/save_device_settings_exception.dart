class SaveDeviceSettingsException implements Exception {
  final String message;

  const SaveDeviceSettingsException([
    this.message = 'Unable to save device settings',
  ]);
}
