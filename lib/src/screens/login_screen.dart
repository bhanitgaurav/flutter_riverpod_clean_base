import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/provider/date_provider.dart';
import 'package:flutter_riverpod_todo_app/src/screens/views/login_view.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';
import 'package:flutter_riverpod_todo_app/src/utils/helpers.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/app_background.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/display_white_text.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);

    return Scaffold(
        body: Stack(
      children: [
        AppBackground(
          headerHeight: deviceSize.height * 0.3,
          header: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => {Helpers.selectDate(context, ref)},
                  child: DisplayWhiteText(
                    text: Helpers.dateFormatter(date),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const DisplayWhiteText(text: 'Flutter Login', size: 40),
              ],
            ),
          ),
        ),
        Positioned(
          top: (deviceSize.height * 0.3) - 40,
          left: 0,
          right: 0,
          child: const SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoginView(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
