import 'package:flutter/cupertino.dart';
import 'package:tesis_1/app/domain/responses/sign_up_response.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';
import 'package:tesis_1/generated/l10n.dart';
import '../register_page.dart' show registerProvider;
import 'package:flutter_meedu/ui.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formkey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = S.of(context).simpleText24;
          break;
        case SignUpError.weakPassword:
          content = S.of(context).simpleText25;
          break;
        case SignUpError.tooManyRequests:
          content = S.of(context).simpleText13;
          break;
        case SignUpError.unknown:
        default:
          content = S.of(context).simpleText14;
          break;
      }
      Dialogs.alert(
        context,
        title: "ERROR",
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
  } else {
    Dialogs.alert(
      context,
      title: "ERROR",
      content: S.of(context).simpleText15,
    );
  }
}
