import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tesis_1/app/tmp_graphic.dart';

class Graphic_Comerciales extends StatelessWidget {
  const Graphic_Comerciales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comerciales (TIP)'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 580,
                  height: 580,
                  child: const _DateCommercial(),
                )
              ],
            ),
          ),
        ));
  }
}

class _DateCommercial extends StatefulWidget {
  const _DateCommercial({Key? key}) : super(key: key);

  @override
  State<_DateCommercial> createState() => __DateCommercialState();
}

class __DateCommercialState extends State<_DateCommercial> {
  final _URL_BANCO_CENTRAL =
      'https://si3.bcentral.cl/SieteRestWS/SieteRestWS.ashx';

  final _User = '196686746';

  final _PASS = '98pnQn6ja52v';

  final _TIMESERIES = 'F022.COM.TIP.Z.NO.Z.M';
  bool loading = true;
  List<TimeSeriesSales> _data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InitialGraphic();
  }

  Future InitialGraphic() async {
    final url =
        '$_URL_BANCO_CENTRAL?user=$_User&pass=$_PASS&firstdate=2022-01-01&lastdate=2022-12-01&timeseries=$_TIMESERIES';
    final res = await http.get(Uri.parse(url));
    final jsondata = jsonDecode(res.body);
    _data = [];
    for (var item in jsondata['Series']['Obs']) {
      print(item);
      var n = item['indexDateString'].split('-');
      _data.add(
        TimeSeriesSales(
            DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
            double.parse(item['value'])),
      );
    }
    setState(() {
      loading = false;
    });
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 01, 01),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Gráfico comercial (TIP)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: pickDateRange,
                    child: Text('${start.day}-${start.month}-${start.year}'),
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: pickDateRange,
                    child: Text('${end.day}-${end.month}-${end.year}'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                      height: 400.0,
                      width: 360.0,
                      child: (loading == true)
                          ? Transform.scale(
                              scale: 0.3,
                              child: CircularProgressIndicator(),
                            )
                          : SimpleTimeSeriesChart.withSampleData(_data)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2002),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Column(
            children: [
              const SizedBox(height: 100),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 550,
                  maxWidth: 380,
                ),
                child: child,
              )
            ],
          );
        });
    if (newDateRange != null) {
      String fecha_inicial =
          DateFormat('yyyy-MM-dd').format(newDateRange.start);
      String fecha_final = DateFormat('yyyy-MM-dd').format(newDateRange.end);
      print(fecha_inicial);
      print(fecha_final);
      final url =
          '$_URL_BANCO_CENTRAL?user=$_User&pass=$_PASS&firstdate=$fecha_inicial&lastdate=$fecha_final&timeseries=$_TIMESERIES';
      final res = await http.get(Uri.parse(url));
      final jsondata = jsonDecode(res.body);
      _data = [];
      for (var item in jsondata['Series']['Obs']) {
        print(item);
        var n = item['indexDateString'].split('-');
        _data.add(
          TimeSeriesSales(
              DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
              double.parse(item['value'])),
        );

        setState(() {
          dateRange = newDateRange;
          bool loading = false;
        });
      }
    }
  }
}
