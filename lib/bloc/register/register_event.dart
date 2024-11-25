import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  final String fullname;
  final String email;
  final String phone;
  final String password;

  const RegisterButtonPressed({
    required this.email, 
    required this.password,
    required this.phone,
    required this.password
    });

  @override
  List<Object?> get props => [fullname, email, password, password];
}
