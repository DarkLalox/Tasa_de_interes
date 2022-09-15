import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/data/data_source/services/interest_service.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/news/widgets/list_interest.dart';

final interestService = SimpleProvider(
  (ref) => InterestService(),
);

class InterestRate extends StatelessWidget {
  const InterestRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasa de interés"),
      ),
      body: Consumer(builder: (_, ref, __) {
        final controller = ref.watch(interestService);
        return Scaffold(
            body: (controller.interesrate.length == 0)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListInterest(controller.interesrate));
      }),
    );
  }
}
