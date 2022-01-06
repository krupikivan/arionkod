import 'package:equatable/equatable.dart';

/// Represents a failure in the program
class Failure extends Equatable implements Exception {
  const Failure(this.message);
  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}
