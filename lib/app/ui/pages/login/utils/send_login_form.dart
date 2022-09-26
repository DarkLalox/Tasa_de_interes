import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';
import 'package:tesis_1/generated/l10n.dart';
import '../../../../domain/responses/sign_in_response.dart';
import '../login_page.dart' show loginProvider;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formkey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String errorMessage = "";

      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = S.of(context).simpleTex9;
          break;
        case SignInError.userDisabled:
          errorMessage = S.of(context).simpleText10;
          break;
        case SignInError.userNotFound:
          errorMessage = S.of(context).simpleText11;
          break;
        case SignInError.wrongPassword:
          errorMessage = S.of(context).simpleText12;
          break;
        case SignInError.tooManyRequests:
          errorMessage = S.of(context).simpleText13;
          break;
        case SignInError.unknown:
        default:
          errorMessage = S.of(context).simpleText14;
          break;
      }
      Dialogs.alert(
        context,
        title: "ERROR",
        content: errorMessage,
      );
    } else {
      router.pushReplacementNamed(
        Routes.HOME,
      );
    }
  } else {
    Dialogs.alert(
      context,
      title: "ERROR",
      content: S.of(context).simpleTexct15,
    );
  }
}
