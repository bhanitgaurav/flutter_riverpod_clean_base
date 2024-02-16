import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/src/utils/extensions.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
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
//   required Task task,
// }) async {
//   Widget cancelButton = TextButton(
//     child: const Text('NO'),
//     onPressed: () => context.pop(),
//   );
//   Widget deleteButton = TextButton(
//     onPressed: () async {
//       await ref.read(tasksProvider.notifier).deleteTask(task).then(
//         (value) {
//           displaySnackbar(
//             context,
//             'Task deleted successfully',
//           );
//           context.pop();
//         },
//       );
//     },
//     child: const Text('YES'),
//   );
//
//   AlertDialog alert = AlertDialog(
//     title: const Text('Are you sure you want to delete this task?'),
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
