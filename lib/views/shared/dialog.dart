import 'package:flutter/material.dart';

class MyDialogUtils {
  static void showLoadingDialog(BuildContext context, String message,
      {bool isDismissible = false}) {
    showDialog(
      context: context,
      builder: (buildContext) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: Color.fromARGB(255, 76, 229, 177),
              ),
              const SizedBox(width: 12),
              Text(message),
            ],
          ),
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static void showMessage(
      BuildContext context, String Message, String posActionButton,
      {VoidCallback? posAction}) {
    List<Widget> actions = [];
    if (posActionButton != null) {
      actions.add(TextButton(
        child: Text(posActionButton),
        onPressed: () {
          hideDialog(context);
          if (posAction != null) {
            posAction();
          }
        },
      ));
    }

    showDialog(
        context: context,
        builder: (BuildContext) {
          barrierDismissible:
          true;
          return AlertDialog(
            content: Text(Message),
            actions: actions,
          );
        });
  }

  static void showAnotherMessage(
      BuildContext context, String Message, String posActionButton,
      {VoidCallback? posAction, VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionButton != null) {
      actions.add(TextButton(
        child: Text(
          posActionButton,
          style: const TextStyle(
            color: Color.fromARGB(255, 40, 205, 196),
          ),
        ),
        onPressed: () {
          hideDialog(context);
          if (posAction != null) {
            posAction();
          }
        },
      ));
    }
    showDialog(
        context: context,
        builder: (BuildContext) {
          barrierDismissible:
          true;
          return AlertDialog(
            content: Text(
              Message,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            actions: actions,
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
