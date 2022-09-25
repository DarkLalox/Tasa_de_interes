import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:tesis_1/app/tmp_graphic.dart';
import 'package:tesis_1/app/tmp_graphic2.dart';

class Graphic_Comercio_Exterior extends StatelessWidget {
  const Graphic_Comercio_Exterior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comercio exterior (TIP)'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 580,
                  height: 580,
                  child: isDark
                      ? const _DateComercio_Exterior()
                      : const _DateComercio_Exterior1(),
                )
              ],
            ),
          ),
        ));
  }
}

class _DateComercio_Exterior extends StatefulWidget {
  const _DateComercio_Exterior({Key? key}) : super(key: key);

  @override
  State<_DateComercio_Exterior> createState() => __DateComercio_ExteriorState();
}

class __DateComercio_ExteriorState extends State<_DateComercio_Exterior> {
  final _URL_BANCO_CENTRAL =
      'https://si3.bcentral.cl/SieteRestWS/SieteRestWS.ashx';

  final _User = '196686746';

  final _PASS = '98pnQn6ja52v';

  final _TIMESERIES = 'F022.CMX.TIP.Z.US.Z.M';
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
      if (!double.parse(item["value"]).isNaN) {
        print(item);
        var n = item['indexDateString'].split('-');
        _data.add(TimeSeriesSales(
            DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
            double.parse(item['value'])));
      }
    }
    if (!mounted) return;
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
            const Text("Gráfico Comercio Exterior",
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
                      width: 350.0,
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
        if (!double.parse(item["value"]).isNaN) {
          print(item);
          var n = item['indexDateString'].split('-');
          _data.add(TimeSeriesSales(
              DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
              double.parse(item['value'])));
        }
      }
      setState(() {
        dateRange = newDateRange;
        bool loading = false;
      });
    }
  }
}

class _DateComercio_Exterior1 extends StatefulWidget {
  const _DateComercio_Exterior1({Key? key}) : super(key: key);

  @override
  State<_DateComercio_Exterior1> createState() =>
      __DateComercio_ExteriorState1();
}

class __DateComercio_ExteriorState1 extends State<_DateComercio_Exterior1> {
  final _URL_BANCO_CENTRAL =
      'https://si3.bcentral.cl/SieteRestWS/SieteRestWS.ashx';

  final _User = '196686746';

  final _PASS = '98pnQn6ja52v';

  final _TIMESERIES = 'F022.CMX.TIP.Z.US.Z.M';
  bool loading = true;
  List<TimeSeriesSales1> _data1 = [];
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
    _data1 = [];
    for (var item in jsondata['Series']['Obs']) {
      if (!double.parse(item["value"]).isNaN) {
        print(item);
        var n = item['indexDateString'].split('-');
        _data1.add(TimeSeriesSales1(
            DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
            double.parse(item['value'])));
      }
    }
    if (!mounted) return;
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
            const Text("Gráfico TPM",
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
                      width: 350.0,
                      child: (loading == true)
                          ? Transform.scale(
                              scale: 0.3,
                              child: CircularProgressIndicator(),
                            )
                          : SimpleTimeSeriesChart1.withSampleData(_data1)),
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
                child: Theme(
                    data: ThemeData.light().copyWith(primaryColor: Colors.blue),
                    child: child!),
                constraints: BoxConstraints(
                  maxHeight: 550,
                  maxWidth: 380,
                ),
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
      _data1 = [];
      for (var item in jsondata['Series']['Obs']) {
        if (!double.parse(item["value"]).isNaN) {
          print(item);
          var n = item['indexDateString'].split('-');
          _data1.add(TimeSeriesSales1(
              DateTime(int.parse(n[2]), int.parse(n[1]), int.parse(n[0])),
              double.parse(item['value'])));
        }
      }

      setState(() {
        dateRange = newDateRange;
        bool loading = false;
      });
    }
  }
}
