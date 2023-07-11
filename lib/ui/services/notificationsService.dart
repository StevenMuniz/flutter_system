import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarErr(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.6),
        content: Text(message,
            style: const TextStyle(color: Colors.white, fontSize: 20)));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbarInformation(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.green.withOpacity(1),
        content: Text(message,
            style: const TextStyle(color: Colors.white, fontSize: 20)));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
