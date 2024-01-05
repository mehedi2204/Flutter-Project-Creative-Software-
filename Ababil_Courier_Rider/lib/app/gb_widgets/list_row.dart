import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  final String? title, value;
  const ListRow({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title.toString(),
            overflow: TextOverflow.fade,
            style: CustomThemes().titleStyle.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          flex: 4,
          child: Text(
            ": $value",
            overflow: TextOverflow.fade,
            style: CustomThemes()
                .titleStyle
                .copyWith(fontSize: 16, wordSpacing: 1),
          ),
        ),
      ],
    );
  }
}
