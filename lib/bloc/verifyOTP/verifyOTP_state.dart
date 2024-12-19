import 'package:equatable/equatable.dart';

abstract class VerifyOTPState extends Equatable {
  const VerifyOTPState();

  @override
  List<Object?> get props => [];
}

class VerifyOTPInitial extends VerifyOTPState {}

class VerifyOTPLoading extends VerifyOTPState {}

class VerifyOTPSuccess extends VerifyOTPState {
  const VerifyOTPSuccess();

  @override
  List<Object?> get props => [];
}

class VerifyOTPFailure extends VerifyOTPState {
  final String error;

  const VerifyOTPFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
