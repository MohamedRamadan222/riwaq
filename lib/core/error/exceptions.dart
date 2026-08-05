class ServerException implements Exception {
  final String errMsg;

  ServerException(this.errMsg);
}

class CacheException implements Exception {
  final String errMsg;

  CacheException(this.errMsg);
}
