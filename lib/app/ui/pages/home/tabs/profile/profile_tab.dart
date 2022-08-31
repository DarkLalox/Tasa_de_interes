import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_controllers/session_controller.dart';
import 'package:tesis_1/app/ui/global_controllers/theme_controller.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tesis_1/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({Key? key}) : super(key: key);

  void _updateDisplayName(BuildContext context) async {
    final SessionController = sessionProvider.read;
    List<String> splilName = SessionController.user!.displayName!.split(" ");
    final value = await showInputDialog(
      context,
      initialValue: splilName.first,
    );
    if (value != null) {
      ProgressDialog.show(context);
      final val = value + " " + splilName.last;
      final user = await SessionController.updateDisplayName(val);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Verificar tu conexión internet",
        );
      }
    }
  }

  void _updateDisplayName2(BuildContext context) async {
    final SessionController = sessionProvider.read;
    List<String> splilName = SessionController.user!.displayName!.split(" ");
    final value = await showInputDialog(
      context,
      initialValue: splilName.last,
    );
    if (value != null) {
      ProgressDialog.show(context);
      final val = splilName.first + " " + value;
      final user = await SessionController.updateDisplayName(val);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Verificar tu conexión internet",
        );
      }
    }
  }

  void _updateEmail(BuildContext context) async {
    final SessionController = sessionProvider.read;
    final value = await showInputDialog(
      context,
    );
    if (value != null) {
      ProgressDialog.show(context);
      final user = await SessionController.updateEmail(value);
      Navigator.pop(context);
      if (user == null) {
        Dialogs.alert(
          context,
          title: "ERROR",
          content: "Verificar tu conexión internet",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, ref) {
    final sessionController = ref.watch(sessionProvider);
    final isDark = context.isDarkMode;
    final user = sessionController.user!;
    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : "";
    List<String> splilName = user.displayName!.split(" ");

    return ListView(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 75,
          child: user.photoURL == null
              ? Text(
                  letter,
                  style: const TextStyle(fontSize: 65),
                )
              : null,
          backgroundImage:
              user.photoURL != null ? NetworkImage(user.photoURL!) : null,
        ),
        const SizedBox(height: 10),
        Center(
            child: Text(
          splilName.first,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(child: Text(splilName.last)),
        Center(child: Text(user.email ?? '')),
        const SizedBox(height: 20),
        //const Text("Perfil"),
        LabelButton(
          label: "Usuario",
          value: splilName.first,
          onPressed: () => _updateDisplayName(context),
        ),
        LabelButton(
          label: "PYME",
          value: splilName.last,
          onPressed: () => _updateDisplayName2(context),
        ),
        LabelButton(
            label: "Correo electrónico",
            value: user.email ?? '',
            onPressed: () => _updateEmail(context)),
        LabelButton(
          label: "Correo electrónico verificado",
          value: user.emailVerified ? "YES" : "NO",
        ),
        CupertinoSwitch(
          value: isDark,
          onChanged: (_) {
            themeProvider.read.toggle();
          },
        ),
        LabelButton(
          label: "Cerrar sesión",
          value: "",
          onPressed: () async {
            await sessionProvider.read.signOut();
            router.pushNamedAndRemoveUntil(Routes.LOGIN);
          },
        ),
      ],
    );
  }
}

class LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const LabelButton({
    Key? key,
    required this.label,
    required this.value,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final iconColor = isDark ? Colors.white30 : Colors.black45;
    return ListTile(
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      leading: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.chevron_right_rounded,
            size: 22,
            color: onPressed != null ? iconColor : Colors.transparent,
          )
        ],
      ),
    );
  }
}
