import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/data/data_source/services/interest_service.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/news/widgets/list_interest.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tesis_1/generated/l10n.dart';

class InterestRate extends StatelessWidget {
  const InterestRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).simpleText42),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 65),
                Container(
                  width: 300,
                  height: 300,
                  child: const _Date(),
                ),
              ],
            ),
          ),
        ));
  }
}

class _Date extends StatefulWidget {
  const _Date({Key? key}) : super(key: key);
  @override
  State<_Date> createState() => _DateState();
}

class _DateState extends State<_Date> {
  String _date = "???";
  String _tasa = "???";
  bool loading = true;

  final _URL_BANCO_CENTRAL =
      'https://si3.bcentral.cl/SieteRestWS/SieteRestWS.ashx';
  final _User = '196686746';
  final _PASS = '98pnQn6ja52v';
  final _TIMESERIES = 'F022.TPM.TIN.D001.NO.Z.D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(S.of(context).simpleText46,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )),
              const SizedBox(height: 40),
              SizedBox(
                width: 234,
                height: 55,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    final result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1997),
                      lastDate: DateTime.now(),
                    );
                    if (result != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(result);
                      if (!mounted) return;
                      setState(() {
                        _date = formattedDate;
                      });
                      final url =
                          '$_URL_BANCO_CENTRAL?user=$_User&pass=$_PASS&firstdate=$formattedDate&lastdate=$formattedDate&timeseries=$_TIMESERIES';
                      final res = await http.get(Uri.parse(url));
                      final jsondata = jsonDecode(res.body);
                      if (!jsondata["Series"]["Obs"].isEmpty) {
                        if (!mounted) return;
                        setState(() {
                          _tasa = jsondata["Series"]["Obs"][0]["value"];
                          loading == false;
                        });
                      } else {
                        if (!mounted) return;
                        setState(() {
                          _tasa = S.of(context).simpleText47;
                          loading = false;
                        });
                      }
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    S.of(context).simpleText48,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 60),
                  (_date == '???')
                      ? const Text(" ")
                      : Text(
                          S.of(context).textWithPlaceholder2(
                              DateFormat('dd-MM-yyyy')
                                  .format(DateTime.parse(_date))),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                  const SizedBox(height: 30),
                  (loading == true && (_date != '???' && _tasa == '???'))
                      ? const CircularProgressIndicator()
                      : (_tasa == '???')
                          ? const Text(" ")
                          : Text(S.of(context).textWithPlaceholder3(_tasa),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
