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
import 'package:tesis_1/generated/l10n.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isDark = context.isDarkMode;
    final sessionController = ref.watch(sessionProvider);
    final user = sessionController.user!;
    final displayName = user.displayName ?? '';
    final letter = displayName.isNotEmpty ? displayName[0] : "";
    List<String> splilName = user.displayName!.split(" ");
    return Scaffold(
      appBar: AppBar(),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              child: Text(S.of(context).textWithPlaceholder(splilName.first),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 70),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: SvgPicture.asset(
                'assets/images/${isDark ? 'dark' : 'light'}/Home.svg',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              S.of(context).simpleText39,
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              S.of(context).simpleText40,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends ConsumerWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
              title: Text(S.of(context).simpleText41),
              leading: const Icon(Icons.home),
              onTap: () {
                router.push(const HomePage());
              }),
          ListTile(
            title: Text(S.of(context).simpleText42),
            leading: const Icon(Icons.graphic_eq_rounded),
            onTap: () {
              router.push(const InterestRate());
            },
          ),
          ListTile(
            title: Text(S.of(context).simpleText43),
            leading: const Icon(Icons.bar_chart),
            onTap: () {
              router.push(const Graphic());
            },
          ),
          ListTile(
            title: Text(S.of(context).simpleText44),
            leading: const Icon(Icons.auto_stories_outlined),
            onTap: () {
              router.push(const News());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text(S.of(context).simpleText45),
            leading: const Icon(Icons.language),
            onTap: () {
              router.push(const Language());
            },
          ),
          ListTile(
            title: Text(S.of(context).simpleText36),
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
