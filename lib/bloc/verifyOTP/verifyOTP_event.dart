import 'package:equatable/equatable.dart';

// Class VerifyOTPEvent cơ bản
abstract class VerifyOTPEvent extends Equatable {
  const VerifyOTPEvent();

  @override
  List<Object?> get props => [];
}
 
class VerifyOTPButtonPressed extends VerifyOTPEvent {
  final String email; 
  final String otp; 

  const VerifyOTPButtonPressed({required this.email, required this.otp}); 

  @override
  List<Object?> get props => [otp]; 
}
