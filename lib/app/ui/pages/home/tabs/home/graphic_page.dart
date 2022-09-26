import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_TPM.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_commercial.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_consumer.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_foreign_trade.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_housing.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_tib.dart';
import 'package:tesis_1/generated/l10n.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).simpleText43),
      ),
      body: const ListTileGraphic(),
    );
  }
}

class ListTileGraphic extends StatelessWidget {
  const ListTileGraphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText49),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_TPM());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText50),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_TIB());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText51),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_Consumo());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText52),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_Housing());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText53),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_Comercio_Exterior());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
            ListTile(
              title: Text(S.of(context).simpleText54),
              leading: const Icon(Icons.trending_up),
              onTap: () {
                router.push(const Graphic_Comerciales());
              },
            ),
            Divider(color: isDark ? Colors.white : Colors.black54),
          ],
        ),
      ),
    );
  }
}
