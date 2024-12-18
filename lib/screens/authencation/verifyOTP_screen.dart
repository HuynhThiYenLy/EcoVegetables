import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:ecovegetables_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecovegetables_app/styles/app_image.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              AppImage.logo,
              width: AppSize.sp200,
              height: AppSize.sp200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Nhập mã OTP được gửi đến số điện thoại của bạn',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Dùng custom widget OTPInputField ở đây
            OTPInputField(
              length: 6,
              onChanged: handleOTPChange,
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: 'button.otpVerify'.tr(),
              onPressed: () {
                // Xử lý xác nhận OTP
                print("Đang xác nhận OTP...");
              },
              color: AppTheme.button,
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: CustomTextButton(
                text: 'buttonText.reSent'.tr(),
                onPressed: () {
                  // Xử lý gửi lại OTP
                  print("Gửi lại mã OTP...");
                },
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
