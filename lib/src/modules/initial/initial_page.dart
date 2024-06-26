import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_money/src/router/app_router.dart';
import 'package:my_money/src/shared/colors/app_colors.dart';
import 'package:my_money/src/shared/components/app_logo_title.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_sorage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  void redirect(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      String? user = await AppSecureStorage.readItem(Appkeys.user);

      Navigator.of(context).pushReplacementNamed(
          user != null ? AppRouter.home : AppRouter.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    redirect(context);
    return const Scaffold(
      backgroundColor: AppColors.initialPageBackground,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppLogoTitle(title: 'My Money'),
          ],
        ),
      )),
    );
  }
}
