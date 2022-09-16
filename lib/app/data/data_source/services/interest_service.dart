import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:http/http.dart' as http;
import 'package:tesis_1/app/domain/models/interest_models.dart';

final _URL_BANCO_CENTRAL =
    'https://si3.bcentral.cl/SieteRestWS/SieteRestWS.ashx';
final _User = '196686746';
final _PASS = '98pnQn6ja52v';
final _TIMESERIES = 'F022.TPM.TIN.D001.NO.Z.D';

class InterestService extends SimpleNotifier {
  List<Ob> interesrate = [];
  InterestService() {
    this.getInterest();
  }

  getInterest() async {
    final url =
        '$_URL_BANCO_CENTRAL?user=$_User&pass=$_PASS&firstdate=2022-09-08&lastdate=2022-09-08&timeseries=$_TIMESERIES';
    final res = await http.get(Uri.parse(url));
    final interesResponse = interestResponseFromJson(res.body);
    this.interesrate.addAll(interesResponse.series.obs);
    notify();
  }
}
