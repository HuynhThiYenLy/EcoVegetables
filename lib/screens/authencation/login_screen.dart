import 'package:ecovegetables_app/bloc/login/login_event.dart';
import 'package:ecovegetables_app/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/login/login_bloc.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  final TabController tabController;

  // Tạo controller cho email và password
  final TextEditingController emailController =
      TextEditingController(text: "yenlyhuynhthi991@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "yenly123");

  LoginScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSize.sp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email TextField
          Text(
            'label.email'.tr(),
            style: TextStyle(
              color: AppTheme.text,
              fontWeight: FontWeight.bold,
              fontSize: AppSize.sp16,
            ),
          ),
          const SizedBox(height: AppSize.sp10),
          TextField(
            controller: emailController, // Gắn controller cho Email
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
              ),
            ),
          ),
          const SizedBox(height: AppSize.sp20),

          // Password TextField
          Text(
            'label.password'.tr(),
            style: TextStyle(
              color: AppTheme.text,
              fontWeight: FontWeight.bold,
              fontSize: AppSize.sp16,
            ),
          ),
          const SizedBox(height: AppSize.sp10),
          TextField(
            controller: passwordController, // Gắn controller cho Password
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
              ),
            ),
          ),
          const SizedBox(height: AppSize.sp20),

          // Login Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cancel Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("Cancel!");
                  },
                  child: Text(
                    'button.cancel'.tr(),
                    style: TextStyle(fontSize: AppSize.sp16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    padding: EdgeInsets.symmetric(vertical: AppSize.sp16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.sp12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSize.sp10),

              // Login Button with BlocConsumer
              Expanded(
                child: BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      print(
                          "LoginScreen: Login failed with error = ${state.error}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    } else if (state is LoginSuccess) {
                      print(
                          "LoginScreen: Login successful - Token = ${state.token}");

                      // Chuyển sang tab đăng ký sau khi đăng nhập thành công
                      tabController.index = 1; // Chuyển qua Register tab
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      print("LoginScreen: State is LoginLoading");
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () {
                        final email = emailController.text;
                        final password = passwordController.text;

                        print("LoginScreen: Login button pressed");
                        print(
                            "LoginScreen: Input Email = $email, Password = $password");

                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: email,
                                password: password,
                              ),
                            );
                      },
                      child: Text(
                        'button.login'.tr(),
                        style: TextStyle(fontSize: AppSize.sp16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.button,
                        padding: EdgeInsets.symmetric(vertical: AppSize.sp16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.sp12),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
