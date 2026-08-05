import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errMsg;

  const Failure(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMsg);
}

class CacheFailure extends Failure {
  const CacheFailure(super.errMsg);
}
