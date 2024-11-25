import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:ecovegetables_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecovegetables_app/styles/app_size.dart';

class RegisterScreen extends StatelessWidget {
  final TabController tabController;

  const RegisterScreen({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Bao bọc toàn bộ giao diện trong SingleChildScrollView để cuộn khi bàn phím xuất hiện
      child: Padding(
        padding: const EdgeInsets.all(AppSize.sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'label.fullname'.tr(),
              style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
                ),
              ),
            ),
            const SizedBox(height: AppSize.sp10),
            Text(
              'label.email'.tr(),
              style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
                ),
              ),
            ),
            const SizedBox(height: AppSize.sp10),
            Text(
              'label.phone'.tr(),
              style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
                ),
              ),
            ),
            const SizedBox(height: AppSize.sp20),

            // TextField Password
            Text(
              'label.password'.tr(),
              style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
                ),
              ),
            ),
            const SizedBox(height: AppSize.sp10),
            Text(
              'label.rePassword'.tr(),
              style: TextStyle(
                  color: AppTheme.text,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.sp16),
            ),
            const SizedBox(height: AppSize.sp10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.sp12)),
                ),
              ),
            ),

            const SizedBox(height: AppSize.sp20),

            // Các nút Đăng nhập và Hủy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Hủy!");
                    },
                    child: Text(
                      'button.cancel'.tr(),
                      style: TextStyle(fontSize: AppSize.sp16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: AppTheme.textButton,
                      padding: EdgeInsets.symmetric(vertical: AppSize.sp16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.sp12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.sp10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Đăng nhập!");
                    },
                    child: Text(
                      'button.register'.tr(),
                      style: TextStyle(fontSize: AppSize.sp16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.button,
                      foregroundColor: AppTheme.textButton,
                      padding: EdgeInsets.symmetric(vertical: AppSize.sp16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.sp12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
