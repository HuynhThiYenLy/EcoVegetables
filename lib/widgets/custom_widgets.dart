import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:ecovegetables_app/styles/app_size.dart';

// MARK: TextField
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: AppSize.sp16,
        color: AppTheme.text,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.sp12, vertical: AppSize.sp14),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: AppSize.sp14,
          color: AppTheme.hint,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.sp12),
        ),
        suffixIcon: suffixIcon, 
      ),
      validator: validator,
    );
  }
}

// MARK: ElevatedButton
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final BorderSide? border;
  final String? icon; // Sửa thành String để lưu đường dẫn ảnh

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppTheme.button,
        padding: EdgeInsets.symmetric(vertical: AppSize.sp16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.sp12),
          side: border ?? BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Image.network(
              icon!,
              width: AppSize.sp20,
              height: AppSize.sp20,
            ),
            SizedBox(width: AppSize.sp14),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: AppSize.sp16,
              color: textColor ?? AppTheme.textButton,
            ),
          ),
        ],
      ),
    );
  }
}

// MARK: Label
class CustomLabel extends StatelessWidget {
  final String text;

  const CustomLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(),
      style: TextStyle(
        color: AppTheme.text,
        fontWeight: FontWeight.bold,
        fontSize: AppSize.sp16,
      ),
    );
  }
}

// MARK: AppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.network(
          AppImage.icon_back,
          width: AppSize.sp40,
          height: AppSize.sp30,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(
        title.tr(),
        style: const TextStyle(
          fontSize: AppSize.sp20,
          fontWeight: FontWeight.bold,
          color: AppTheme.text,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// MARK: Otp Field
class OTPInputField extends StatelessWidget {
  final int length; // Số lượng ô nhập OTP
  final Function(String) onChanged;

  OTPInputField({required this.length, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(length, (index) {
        return SizedBox(
          width: AppSize.sp50,
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppSize.sp24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.grey, width: AppSize.sp2),
                borderRadius: BorderRadius.circular(AppSize.sp10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.buttonText, width: AppSize.sp2),
                borderRadius: BorderRadius.circular(AppSize.sp10),
              ),
            ),
            onChanged: (value) {
              onChanged(value); // Gọi callback từ bên ngoài
            },
          ),
        );
      }),
    );
  }
}

// MARK: TextButton
class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
                vertical: AppSize.sp8, horizontal: AppSize.sp16),
        child: Text(
          text,
          style: TextStyle(
            color: AppTheme.buttonText,
            fontSize: AppSize.sp16,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
