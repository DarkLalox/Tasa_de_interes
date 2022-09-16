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
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 130),
              Container(
                width: 300,
                height: 100,
                child: _Date(),
              ),
              Container(width: 37, height: 20, child: _Consumer()),
            ],
          ),
        ));
  }
}

class _Consumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final controller = ref.watch(interestService);
      return Scaffold(
          body: (controller.interesrate.length == 0)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListInterest(controller.interesrate));
    });
  }
}

class _Date extends StatefulWidget {
  const _Date({Key? key}) : super(key: key);

  @override
  State<_Date> createState() => _DateState();
}

class _DateState extends State<_Date> {
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    _dateString() {
      if (_date == null) {
        return 'Elige una Fecha';
      } else {
        return '${_date?.day}-${_date?.month}-${_date?.year}';
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_dateString()),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1997),
                  lastDate: DateTime.now(),
                );
                if (result != null) {
                  setState(() {
                    _date = result;
                    print(_date);
                  });
                }
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text("Elige una fecha"),
            )
          ],
        ),
      ),
    );
  }
}
