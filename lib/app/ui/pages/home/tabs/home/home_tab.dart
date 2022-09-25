import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesis_1/app/ui/global_controllers/session_controller.dart';
import 'package:tesis_1/app/ui/pages/home/home_page.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic_page.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/interest_rate_page.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/language_page.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/news/news_page.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              child: const Text("Hola", style: TextStyle(fontSize: 25)),
            ),
            const SizedBox(height: 70),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: SvgPicture.asset(
                'assets/images/${isDark ? 'dark' : 'light'}/Home.svg',
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Aplicación con información util",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends ConsumerWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context, ref),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, ref) {
    final isDark = context.isDarkMode;
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : "";
    List<String> splilName = user.displayName!.split(" ");
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
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
          Text(splilName.first),
          Text(user.email ?? ''),
          const SizedBox(height: 10),
          Divider(color: isDark ? Colors.white : Colors.black54),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    final isDark = context.isDarkMode;
    return Container(
      child: Column(
        children: [
          ListTile(
              title: const Text('Inicio'),
              leading: const Icon(Icons.home),
              onTap: () {
                router.push(const HomePage());
              }),
          ListTile(
            title: const Text('Tasa de interés'),
            leading: const Icon(Icons.graphic_eq_rounded),
            onTap: () {
              router.push(const InterestRate());
            },
          ),
          ListTile(
            title: const Text('Gráficos'),
            leading: const Icon(Icons.bar_chart),
            onTap: () {
              router.push(const Graphic());
            },
          ),
          ListTile(
            title: const Text('Noticias'),
            leading: const Icon(Icons.auto_stories_outlined),
            onTap: () {
              router.push(const News());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: const Text('Idioma'),
            leading: const Icon(Icons.language),
            onTap: () {
              router.push(const Language());
            },
          ),
          ListTile(
            title: const Text('Cerrar Sesión'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () async {
              await sessionProvider.read.signOut();
              router.pushNamedAndRemoveUntil(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
