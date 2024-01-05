import 'package:flutter/material.dart';

class ReportRow extends StatelessWidget {
  final String? title, value;
  const ReportRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: Text(title.toString())),
        Expanded(
          flex: 6,
          child: SelectableText(
            ": $value",
          ),
        )
      ],
    );
  }
}
