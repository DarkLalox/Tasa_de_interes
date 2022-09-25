import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesis_1/app/ui/pages/login/login_page.dart';
import 'package:tesis_1/generated/l10n.dart';
import '../../../../utils/email_validator.dart';
import '../../../global_widgets/custom_input_field.dart';
import '../../../global_widgets/rounded_button.dart';
import '../../../routes/routes.dart';
import '../utils/send_login_form.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);
  final _controller = loginProvider.read;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final padding = context.mediaQueryPadding;
    final height = context.height - padding.top - padding.bottom;

    return ListView(
      children: [
        SizedBox(
          height: height,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _controller.formkey,
                child: Align(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 360,
                    ),
                    child: Column(
                      mainAxisAlignment: context.isTablet
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        AspectRatio(
                          aspectRatio: 4 / 3,
                          child: SvgPicture.asset(
                            'assets/images/${isDarkMode ? 'dark' : 'light'}/Graphic_Welcome.svg',
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: S.of(context).simpleText5,
                          onChanged: _controller.onEmailChanged,
                          inputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (isValidEmail(text!)) {
                              return null;
                            }
                            return S.of(context).simpleText6;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomInputField(
                          label: S.of(context).simpleText8,
                          onChanged: _controller.onPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if (text!.trim().length >= 6) {
                              return null;
                            }
                            return S.of(context).simpleText7;
                          },
                        ),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              text: S.of(context).simpleText,
                              onPressed: () => sendLoginForm(context),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () =>
                              router.pushNamed(Routes.RESET_PASSWORD),
                          child: Text(
                            S.of(context).simpleText2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).simpleText3),
                            TextButton(
                              onPressed: () => router.pushNamed(
                                Routes.REGISTER,
                              ),
                              child: Text(
                                S.of(context).simpleText4,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        if (!context.isTablet) const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
