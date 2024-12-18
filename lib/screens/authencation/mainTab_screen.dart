import 'package:ecovegetables_app/bloc/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecovegetables_app/bloc/login/login_bloc.dart';
import 'package:ecovegetables_app/screens/authencation/login_screen.dart';
import 'package:ecovegetables_app/screens/authencation/register_screen.dart';
import 'package:ecovegetables_app/styles/app_image.dart';
import 'package:ecovegetables_app/styles/app_size.dart';
import 'package:easy_localization/easy_localization.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({Key? key}) : super(key: key);

  @override
  _MainTabScreenState createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => RegisterBloc()),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.sp150),
          child: AppBar(
            flexibleSpace: Center(
              child: Image.network(
                AppImage.logo,
                width: AppSize.sp200,
                height: AppSize.sp180,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 62, 144, 65),
            bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                  child: Text(
                    'button.login'.tr(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'button.register'.tr(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            LoginScreen(tabController: _tabController),
            RegisterScreen(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
