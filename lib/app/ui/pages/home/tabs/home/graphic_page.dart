import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_TPM.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_commercial.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_consumer.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_foreign_trade.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_housing.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/graphic/graphic_tib.dart';

class Graphic extends StatelessWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gráfico"),
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
      child: Column(
        children: [
          const SizedBox(height: 20),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Tasa de interés monetaria (TPM)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_TPM());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Tasa de interés interbancaria (TIB)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_TIB());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Consumo (TIP)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_Consumo());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Vivienda (TIP)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_Housing());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Comercio exterior (TIP)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_Comercio_Exterior());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
          ListTile(
            title: Text('Comerciales (TIP)'),
            leading: Icon(Icons.trending_up),
            onTap: () {
              router.push(Graphic_Comerciales());
            },
          ),
          Divider(color: isDark ? Colors.white : Colors.black54),
        ],
      ),
    );
  }
}
