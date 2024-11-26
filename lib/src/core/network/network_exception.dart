// ignore_for_file: use_super_parameters

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

class NotFoundException extends NetworkException {
  NotFoundException(String message) : super(message);
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException(String message) : super(message);
}

class BadRequestException extends NetworkException {
  BadRequestException(String message) : super(message);
}

class ServerException extends NetworkException {
  ServerException(String message) : super(message);
}
