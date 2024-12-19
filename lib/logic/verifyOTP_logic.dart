import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_bloc.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_event.dart';

class VerifyOTPLogic {
  final String email;
  final BuildContext context;

  VerifyOTPLogic({required this.email, required this.context});

// MARK: VerifyOTP
  void verifyOTP(List<String> otpValues) {
    String otp = otpValues.join(); // Kết hợp giá trị OTP thành chuỗi

    if (otp.length == 6) {
      context.read<VerifyOTPBloc>().add(VerifyOTPButtonPressed(
            email: email,
            otp: otp,
          ));
    } else {
      print("OTP không hợp lệ");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP phải có 6 chữ số')),
      );
    }
  }


// MARK: reSent
void resendOTP() {
    print("Gửi lại mã OTP cho email: $email");
    // Có thể thêm logic gửi OTP ở đây
  }
}
