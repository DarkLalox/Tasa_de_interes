import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesis_1/app/domain/responses/reset_password_response.dart';
import 'package:tesis_1/app/ui/global_widgets/custom_input_field.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tesis_1/app/ui/global_widgets/rounded_button.dart';
import 'package:tesis_1/app/utils/email_validator.dart';
import 'controller/reset_password_controller.dart';

final resetPasswordProvider = SimpleProvider(
  (_) => ResetPasswordController(),
);

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;
    return ProviderListener<ResetPasswordController>(
      provider: resetPasswordProvider,
      builder: (_, controller) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(
              height: height,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Align(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 360,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: SvgPicture.asset(
                              'assets/images/${isDarkMode ? 'dark' : 'light'}/ForgetPassword.svg',
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              "Restablecer contraseña",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            label: "Correo electrónico",
                            onChanged: controller.onEmailChanged,
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Ingrese su correo electrónico para recibir un enlace para cambiar su contraseña",
                            style: TextStyle(fontSize: 10),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: RoundedButton(
                                onPressed: () => _submit(context),
                                text: "Enviar"),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) async {
    final controller = resetPasswordProvider.read;
    if (isValidEmail(controller.email)) {
      ProgressDialog.show(context);
      final response = await controller.submit();
      Navigator.pop(context);
      if (response == ResetPasswordResponse.ok) {
        Dialogs.alert(
          context,
          title: "Correo Correcto",
          content: "Correo electrónico enviado",
        );
      } else {
        String errorMessage = "";
        switch (response) {
          case ResetPasswordResponse.networkRequestFailed:
            errorMessage = "Solicitud de red fallida";
            break;
          case ResetPasswordResponse.userDisabled:
            errorMessage = "Usuario deshabilitado";
            break;
          case ResetPasswordResponse.userNotFound:
            errorMessage = "Usuario no encontrado";
            break;
          case ResetPasswordResponse.tooManyRequest:
            errorMessage = "Demaciadas peticiones";
            break;
          case ResetPasswordResponse.unknown:
          default:
            errorMessage = "Error desconocido";
            break;
        }
        Dialogs.alert(
          context,
          title: "ERROR",
          content: errorMessage,
        );
      }
    } else {
      Dialogs.alert(context, content: "Correo electrónico inválido");
    }
  }
}
