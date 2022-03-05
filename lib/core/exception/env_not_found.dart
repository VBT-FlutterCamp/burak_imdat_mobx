class EnvNotFoundException implements Exception {
  final String value;

  EnvNotFoundException(this.value);

  @override
  String toString() {
    return 'This $value doesn\'t found in .env file';
  }
}
