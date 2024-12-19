import 'package:ecovegetables_app/bloc/register/register_bloc.dart';
import 'package:ecovegetables_app/bloc/register/register_state.dart';
import 'package:ecovegetables_app/logic/register_logic.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:ecovegetables_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatelessWidget {
  final TabController tabController;

  // Khai báo GlobalKey cho form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // MARK: data Field mẫu
  final TextEditingController fullnameController =
      TextEditingController(text: "YenLy");
  final TextEditingController emailController =
      TextEditingController(text: "lyhtyps27387@fpt.edu.vn");
  final TextEditingController phoneController =
      TextEditingController(text: "0354757122");
  final TextEditingController passwordController =
      TextEditingController(text: "yenly123");
  final TextEditingController rePasswordController =
      TextEditingController(text: "yenly123");

  RegisterScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.sp16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // MARK: fullname
              CustomLabel(text: 'label.fullname'.tr()),
              const SizedBox(height: AppSize.sp10),
              CustomTextField(
                controller: fullnameController,
                hintText: 'label.fullname'.tr(),
              ),
              const SizedBox(height: AppSize.sp20),

              // MARK: email
              CustomLabel(text: 'label.email'.tr()),
              const SizedBox(height: AppSize.sp10),
              CustomTextField(
                controller: emailController,
                hintText: 'label.email'.tr(),
              ),
              const SizedBox(height: AppSize.sp20),

              // MARK: phone
              CustomLabel(text: 'label.phone'.tr()),
              const SizedBox(height: AppSize.sp10),
              CustomTextField(
                controller: phoneController,
                hintText: 'label.phone'.tr(),
              ),
              const SizedBox(height: AppSize.sp20),

              // MARK: Password
              CustomLabel(text: 'label.password'.tr()),
              const SizedBox(height: AppSize.sp10),
              CustomTextField(
                controller: passwordController,
                hintText: 'label.password'.tr(),
                obscureText: true,
              ),
              const SizedBox(height: AppSize.sp20),

              // MARK: re-Pass
              CustomLabel(text: 'label.rePassword'.tr()),
              const SizedBox(height: AppSize.sp10),
              CustomTextField(
                controller: rePasswordController,
                hintText: 'label.rePassword'.tr(),
                obscureText: true,
              ),
              const SizedBox(height: AppSize.sp30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // MARK: Cancel
                    child: CustomElevatedButton(
                      text: 'button.cancel'.tr(),
                      onPressed: () {
                        RegisterScreenLogic.handleCancel(
                          formKey: _formKey,
                          fullnameController: fullnameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          passwordController: passwordController,
                          rePasswordController: rePasswordController,
                          context: context,
                        );
                      },
                      color: AppTheme.primary,
                    ),
                  ),
                  const SizedBox(width: AppSize.sp10),

                  // MARK: register
                  Expanded(
                    child: BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        RegisterScreenLogic.handleBlocListener(
                          context: context,
                          state: state,
                          tabController: tabController,
                        );
                      },
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return RegisterScreenLogic.handleLoadingState();
                        }
                        return CustomElevatedButton(
                          text: 'button.register'.tr(),
                          onPressed: () {
                            RegisterScreenLogic.handleRegister(
                              formKey: _formKey,
                              fullnameController: fullnameController,
                              emailController: emailController,
                              phoneController: phoneController,
                              passwordController: passwordController,
                              rePasswordController: rePasswordController,
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
            ],
          ),
        ),
      ),
    );
  }
}
