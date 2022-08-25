import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';
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
          errorMessage = "Solicitud de red fallida";
          break;
        case SignInError.userDisabled:
          errorMessage = "Usuario Deshabilitado";
          break;
        case SignInError.userNotFound:
          errorMessage = "Usuario no encontrado";
          break;
        case SignInError.wrongPassword:
          errorMessage = "Contraseña Equivocada";
          break;
        case SignInError.tooManyRequests:
          errorMessage = "Demaciadas peticiones";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "Error desconocido";
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
      content: "Campos Inválidos",
    );
  }
}
