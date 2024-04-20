import 'package:equatable/equatable.dart';

class ResponseAttributesItems extends Equatable {
  final String? message;
  final String? status;

  const ResponseAttributesItems({
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}
