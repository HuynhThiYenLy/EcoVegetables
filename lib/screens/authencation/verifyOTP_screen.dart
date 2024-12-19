import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/logic/verifyOTP_logic.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:ecovegetables_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ecovegetables_app/styles/app_image.dart';

typedef OnChangedCallback = void Function(String value, int index);

class OTPInputField extends StatelessWidget {
  final int length;
  final OnChangedCallback onChanged;

  const OTPInputField({Key? key, required this.length, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(length, (index) {
        return SizedBox(
          width: 40,
          child: TextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(counterText: ''),
            onChanged: (value) {
              if (value.isNotEmpty) {
                onChanged(value, index); // Trả về giá trị và vị trí
              }
            },
          ),
        );
      }),
    );
  }
}

class VerifyOTPScreen extends StatelessWidget {
  final String email;

  const VerifyOTPScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final otpLogic = VerifyOTPLogic(email: email, context: context);

    // Dữ liệu lưu trữ các ô OTP
    final List<String> otpValues = List.filled(6, '');

    // Hàm theo dõi sự thay đổi của mỗi ô OTP
    void handleOTPChange(String value, int index) {
      otpValues[index] = value; // Cập nhật giá trị OTP tại vị trí index
      print('Giá trị OTP nhập: $value tại vị trí $index');
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
              onChanged: (value, index) {
                handleOTPChange(value, index);
              },
            ),

            const SizedBox(height: AppSize.sp40),

            // MARK: xác minh OTP
            CustomElevatedButton(
              text: 'button.otpVerify'.tr(),
              onPressed: () {
                otpLogic.verifyOTP(otpValues);
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
                  otpLogic.resendOTP();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
