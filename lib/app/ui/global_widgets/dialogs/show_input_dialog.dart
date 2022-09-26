import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/generated/l10n.dart';

Future<String?> showInputDialog(
  BuildContext context, {
  String? title,
  String? initialValue,
}) async {
  String value = initialValue ?? '';
  final isDarkMode = context.isDarkMode;
  final result = await showCupertinoDialog<String>(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: CupertinoTextField(
        controller: TextEditingController()..text = initialValue ?? '',
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isDarkMode ? const Color(0xff9e9e9e) : Colors.white70,
        ),
        onChanged: (text) {
          value = text;
        },
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, value);
          },
          child: Text(S.of(context).simpleText37),
          isDefaultAction: true,
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(S.of(context).simpleText38),
          isDestructiveAction: true,
        )
      ],
    ),
  );
  if (result != null && result.trim().isEmpty) {
    return null;
  }
  return result;
}
