import 'package:ecovegetables_app/bloc/login/login_bloc.dart';
import 'package:ecovegetables_app/bloc/login/login_event.dart';
import 'package:ecovegetables_app/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenLogic {
  // MARK: check nhập
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
  
  // MARK: logic Cancel
  static void handleCancel({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) { 
    formKey.currentState?.reset();
    emailController.clear();
    passwordController.clear();
    FocusScope.of(context).unfocus();
    print("LoginScreenLogic: Form reset and fields cleared");
  }

  // MARK: logic Login
  static void handleLogin({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;

      print("LoginScreenLogic: Input Email = $email, Password = $password");

      // Gửi sự kiện qua LoginBloc
      context.read<LoginBloc>().add(
            LoginButtonPressed(
              email: email,
              password: password,
            ),
          );
    } else {
      print("LoginScreenLogic: Form validation failed");
    }
  }

  // MARK: listen status
  static void handleBlocListener({
    required BuildContext context,
    required LoginState state,
    required TabController tabController,
  }) {
    if (state is LoginFailure) {
      print("LoginScreenLogic: Login failed with error = ${state.error}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    } else if (state is LoginSuccess) {
      print("LoginScreenLogic: Login successful - Token = ${state.token}");
      tabController.index = 1; // Chuyển qua tab khác
    }
  }

// MARK: check loading
  static Widget handleLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
