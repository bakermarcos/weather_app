import 'failure.dart';

class FailureImp implements Failure {
  @override
  final String msg;
  @override
  final String? label;
  @override
  final dynamic exception;
  @override
  StackTrace? stackTrace;
  FailureImp({required this.msg, this.exception, this.label, this.stackTrace});
}
