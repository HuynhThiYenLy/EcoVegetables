import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_bloc.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_event.dart';
import 'package:ecovegetables_app/bloc/verifyOTP/verifyOTP_state.dart';

class VerifyOTPLogic {
  static void handleVerifyOTP({
    required BuildContext context,
    required String email,
    required String otp,
  }) {
    final bloc = context.read<VerifyOTPBloc>();
    bloc.add(VerifyOTPButtonPressed(email: email, otp: otp));
  }

  static void listenToBlocState({
    required BuildContext context,
    required VerifyOTPState state,
  }) {
    if (state is VerifyOTPSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Xác minh OTP thành công!')),
      );
      // TODO: Điều hướng sang màn hình tiếp theo
    } else if (state is VerifyOTPFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  static void resendOTP({
    required BuildContext context,
    required String email,
  }) {
    print("Gửi lại mã OTP cho email: $email");
    // TODO: Thêm logic gửi lại OTP tại đây
  }
}
