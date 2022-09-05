import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_controllers/session_controller.dart';
import 'package:tesis_1/app/ui/global_widgets/custom_input_field.dart';
import 'package:tesis_1/app/ui/global_widgets/rounded_button.dart';
import 'package:tesis_1/app/ui/pages/register/controller/register_controller.dart';
import 'package:tesis_1/app/ui/pages/register/controller/register_state.dart';
import 'package:tesis_1/app/ui/pages/register/utils/send_register_form.dart';
import 'package:tesis_1/app/utils/email_validator.dart';
import 'package:tesis_1/app/utils/name_validator.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(sessionProvider.read),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
    );
    final padding = context.mediaQueryPadding;
    final height = context.height -
        padding.top -
        padding.bottom -
        appBar.preferredSize.height;
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: appBar,
          body: ListView(
            children: [
              SizedBox(
                height: height,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      child: Form(
                        key: controller.formkey,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 360),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "REGISTRARSE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Nombre",
                                onChanged: controller.onNameChanged,
                                validator: (text) {
                                  return isValidName(text!)
                                      ? null
                                      : "Nombre es inválido";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Nombre PYME",
                                onChanged: controller.onNamePymeChanged,
                                validator: (text) {
                                  return isValidName(text!)
                                      ? null
                                      : "Ingresar Pyme";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Correo electrónico",
                                inputType: TextInputType.emailAddress,
                                onChanged: controller.onEmailChanged,
                                validator: (text) {
                                  return isValidEmail(text!)
                                      ? null
                                      : "Correo electrónico es inválido";
                                },
                              ),
                              const SizedBox(height: 15),
                              CustomInputField(
                                label: "Contraseña",
                                onChanged: controller.onPasswordChanged,
                                isPassword: true,
                                validator: (text) {
                                  if (text!.trim().length >= 6) {
                                    return null;
                                  }
                                  return "Contraseña es inválida";
                                },
                              ),
                              const SizedBox(height: 15),
                              Consumer(
                                builder: (_, ref, __) {
                                  ref.watch(
                                    registerProvider.select(
                                      (_) => _.password,
                                    ),
                                  );
                                  return CustomInputField(
                                    label: "Confirmar contraseña",
                                    onChanged: controller.onVPasswordChanged,
                                    isPassword: true,
                                    validator: (text) {
                                      if (controller.state.password != text) {
                                        return "La contraseña de verificación no coincide ";
                                      }
                                      if (text!.trim().length >= 6) {
                                        return null;
                                      }
                                      return "Contraseña es inválida";
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 30),
                              RoundedButton(
                                text: ("Registro"),
                                onPressed: () => sendRegisterForm(context),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
