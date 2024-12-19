import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:ecovegetables_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecovegetables_app/styles/app_image.dart';

class VerifyOTPScreen extends StatelessWidget {
  // MARK: nhận Email
  final String email;

  const VerifyOTPScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final List<String> otpValues =
        List.filled(6, ''); // Dữ liệu lưu trữ các ô OTP

    void handleOTPChange(String value) {
      print('Giá trị OTP nhập: $value');
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'button.otpVerify'.tr(),
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              AppImage.logo,
              width: AppSize.sp200,
              height: AppSize.sp200,
            ),

            Text(
              'text.otpVerify'.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),

            // MARK: Email
            Text(
              'Email: $email',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: AppSize.sp16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSize.sp40),

            // MARK: nhập OTP
            OTPInputField(
              length: 6,
              onChanged: handleOTPChange,
            ),
            const SizedBox(height: AppSize.sp40),

            // MARK: xác minh OTP
            CustomElevatedButton(
              text: 'button.otpVerify'.tr(),
              onPressed: () {
                print("Đang xác nhận OTP cho email: $email");
              },
              color: AppTheme.button,
            ),
            const SizedBox(height: AppSize.sp20),

            // MARK: reSent
            Container(
              alignment: Alignment.center,
              child: CustomTextButton(
                text: 'buttonText.reSent'.tr(),
                onPressed: () {
                  print("Gửi lại mã OTP cho email: $email");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
