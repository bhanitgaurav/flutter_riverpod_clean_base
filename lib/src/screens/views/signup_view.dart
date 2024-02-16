import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/src/data/models/user.dart';
import 'package:flutter_riverpod_todo_app/src/provider/auth/auth_provider.dart';
import 'package:flutter_riverpod_todo_app/src/provider/date_provider.dart';
import 'package:flutter_riverpod_todo_app/src/provider/time_provider.dart';
import 'package:flutter_riverpod_todo_app/src/utils/app_alerts.dart';
import 'package:flutter_riverpod_todo_app/src/utils/constants.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';
import 'package:flutter_riverpod_todo_app/src/utils/helpers.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/common_text_field.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/display_black_text.dart';
import 'package:flutter_riverpod_todo_app/src/widgets/display_white_text.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CommonTextField(
          hintText: 'Username',
          title: 'Username',
          controller: _usernameController,
        ),
        const Gap(10),
        CommonTextField(
          hintText: 'Password',
          title: 'Password',
          controller: _passwordController,
        ),
        const Gap(30),
        ElevatedButton(
          onPressed: _loading ? null : _signUp,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _loadingSignUp(),
          ),
        ),
        const Gap(10),
        _alreadyHaveAnAccount()
      ],
    );
  }

  void _signUp() async {
    final userName = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (userName.isEmpty || password.isEmpty) {
      AppAlerts.displaySnackBar(context, Constants.usernamePasswordCantEmpty);
      return;
    }
    _showHideLoading(true);

    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);

    final user = User(
      username: userName,
      password: password,
      time: Helpers.timeToString(time),
      date: DateFormat.yMMMd().format(date),
    );

    await ref.read(authProvider.notifier).signUp(user).then((value) {
      _showHideLoading(false);
      if (!value) {
        AppAlerts.displaySnackBar(context, Constants.errorInSignUp);
        return;
      }
      clearTextFields();
      AppAlerts.displaySnackBar(context, Constants.signUpSuccessfully);
      context.navigator.pop();
    });
  }

  Widget _loadingSignUp() {
    if (_loading) {
      return const CircularProgressIndicator();
    } else {
      return const DisplayWhiteText(
        text: 'SignUp',
        fontWeight: FontWeight.w400,
      );
    }
  }

  Widget _alreadyHaveAnAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account ? '),
        TextButton(
          onPressed: () {
            context.navigator.pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: DisplayBlackText(
              text: 'Login',
              fontWeight: FontWeight.bold,
              size: 14,
            ),
          ),
        )
      ],
    );
  }

  void _showHideLoading(bool show) {
    setState(() {
      _loading = show;
    });
  }

  void clearTextFields() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
