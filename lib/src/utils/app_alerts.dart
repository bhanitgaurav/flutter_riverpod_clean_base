import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

// static Future<void> showAlertDeleteDialog({
//   required BuildContext context,
//   required WidgetRef ref,
//   required User user,
// }) async {
//   Widget cancelButton = TextButton(
//     child: const Text('NO'),
//     onPressed: () => context.pop(),
//   );
//   Widget deleteButton = TextButton(
//     onPressed: () async {
//       await ref.read(tasksProvider.notifier).deleteTask(user).then(
//         (value) {
//           displaySnackBar(
//             context,
//             'Task deleted successfully',
//           );
//           context.navigator.pop();
//         },
//       );
//     },
//     child: const Text('YES'),
//   );
//
//   AlertDialog alert = AlertDialog(
//     title: const Text('Are you sure you want to delete this user?'),
//     actions: [
//       deleteButton,
//       cancelButton,
//     ],
//   );
//
//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
}
