import 'package:flutter/material.dart';
import 'package:tesis_1/generated/l10n.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).simpleText45),
      ),
    );
  }
}
