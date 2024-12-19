import 'package:ecovegetables_app/bloc/register/register_bloc.dart';
import 'package:ecovegetables_app/bloc/register/register_event.dart';
import 'package:ecovegetables_app/bloc/register/register_state.dart';
import 'package:ecovegetables_app/screens/authencation/verifyOTP_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenLogic {
  // MARK: check nhập
  // Kiểm tra fullname hợp lệ
  static String? validateFullname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập họ tên';
    }
    if (value.length > 50) {
      return 'Họ tên không được quá 50 kí tự';
    }
    return null; // Hợp lệ
  }

  // Kiểm tra email hợp lệ
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null; // Hợp lệ
  }

  // Kiểm tra sđt hợp lệ
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    if (value.length > 10) {
      return 'Số điện thoại không được quá 10 kí tự';
    }
    return null; // Hợp lệ
  }

  // Kiểm tra mật khẩu hợp lệ
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải dài ít nhất 6 ký tự';
    }
    return null; // Hợp lệ
  }

  // Kiểm tra mật khẩu hợp lệ
  static String? validateRePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải dài ít nhất 6 ký tự';
    }
    return null; // Hợp lệ
  }

  // MARK: logic Cancel
  static void handleCancel({
    required GlobalKey<FormState> formKey,
    required TextEditingController fullnameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
    required BuildContext context,
  }) {
    formKey.currentState?.reset();
    fullnameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    rePasswordController.clear();
    FocusScope.of(context).unfocus();
    print("RegisterScreenLogic: Form reset and fields cleared");
  }

// MARK: logic Register
static void handleRegister({
    required GlobalKey<FormState> formKey,
    required TextEditingController fullnameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
    required BuildContext context,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      final fullname = fullnameController.text;
      final email = emailController.text;
      final phone = phoneController.text;
      final password = passwordController.text;
      final rePassword = rePasswordController.text;

      if (password != rePassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mật khẩu và xác nhận mật khẩu không khớp'),
          ),
        );
        return;
      }

      try {
        final bloc = context.read<RegisterBloc>();

        bloc.add(
          RegisterButtonPressed(
            fullname: fullname,
            email: email,
            phone: phone,
            password: password,
          ),
        );

        // Lắng nghe trạng thái sau khi gửi sự kiện
        await Future.delayed(
            const Duration(milliseconds: 100)); // Chờ một chút để Bloc xử lý

        bloc.stream.listen((state) {
          if (state is RegisterSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VerifyOTPScreen(email: email), 
              ),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        });
      } catch (e) {
        print("Error: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Có lỗi xảy ra')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form không hợp lệ')),
      );
    }
  }

// MARK: listen status
  static void handleBlocListener({
    required BuildContext context,
    required RegisterState state,
    required TabController tabController,
  }) {
    if (state is RegisterFailure) {
      print("RegisterScreenLogic: Register failed with error = ${state.error}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    } else if (state is RegisterSuccess) {
      print("RegisterScreenLogic: Register successful");
      tabController.index = 1; // Chuyển qua tab khác
    }
  }

// MARK: check loading
  static Widget handleLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
