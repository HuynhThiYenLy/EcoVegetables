import 'package:ecovegetables_app/bloc/login/login_state.dart';
import 'package:ecovegetables_app/logic/login_logic.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/login/login_bloc.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/widgets/custom_widgets.dart'; // Import file custom_widgets.dart

class LoginScreen extends StatefulWidget {
  final TabController tabController;

  LoginScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // MARK: data Field mẫu
  final TextEditingController emailController =
      TextEditingController(text: "yenlyhuynhthi991@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "yenly123");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false; // kiểm soát trạng thái mật khẩu

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSize.sp16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // MARK: email TextField
            CustomLabel(text: 'label.email'.tr()),
            const SizedBox(height: AppSize.sp10),
            CustomTextField(
              controller: emailController,
              hintText: 'Vui lòng nhập email',
              validator: LoginScreenLogic.validateEmail,
            ),
            const SizedBox(height: AppSize.sp20),

            // MARK: Pass TextField
            CustomLabel(text: 'label.password'.tr()),
            const SizedBox(height: AppSize.sp10),
            CustomTextField(
              controller: passwordController,
              hintText: 'Vui lòng nhập mật khẩu',
              obscureText: !isPasswordVisible,
              validator: LoginScreenLogic.validatePassword,
              suffixIcon: IconButton(
                icon: SizedBox(
                  width: AppSize.sp24,
                  height: AppSize.sp24,
                  child: Image.network(
                    isPasswordVisible ? AppImage.eye_hien : AppImage.eye_an,
                    fit: BoxFit.contain, 
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),

            const SizedBox(height: AppSize.sp10),

            // MARK: forgotPass btn
            Container(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                text: 'buttonText.forgot_password'.tr(),
                onPressed: () {
                  print('forgot_password');
                },
              ),
            ),

            const SizedBox(height: AppSize.sp10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // MARK: cancel btn
                Expanded(
                  child: CustomElevatedButton(
                    text: 'button.cancel'.tr(),
                    onPressed: () {
                      LoginScreenLogic.handleCancel(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        context: context,
                      );
                    },
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(width: AppSize.sp10),

                // MARK: login btn
                Expanded(
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      LoginScreenLogic.handleBlocListener(
                        context: context,
                        state: state,
                        tabController:
                            widget.tabController, // widget.chỉ có statefull
                      );
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return LoginScreenLogic.handleLoadingState();
                      }
                      return CustomElevatedButton(
                        text: 'button.login'.tr(),
                        onPressed: () {
                          LoginScreenLogic.handleLogin(
                            formKey: _formKey,
                            emailController: emailController,
                            passwordController: passwordController,
                            context: context,
                          );
                        },
                        color: AppTheme.button,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.sp20),

// MARK: -- OR --
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppTheme.grey,
                    thickness: AppSize.sp2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.sp8),
                  child: Text(
                    'text.or'.tr(),
                    style: TextStyle(fontSize: AppSize.sp16),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: AppTheme.grey,
                    thickness: AppSize.sp2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.sp20),

// MARK: login GG
            CustomElevatedButton(
              text: 'button.loginGG'.tr(),
              icon: AppImage.icon_gg,
              onPressed: () {
                print("Đang login with gg...");
              },
              color: AppTheme.white,
              textColor: AppTheme.text,
              border:
                  BorderSide(color: AppTheme.borderColor, width: AppSize.sp2),
            ),
          ],
        ),
      ),
    );
  }
}
