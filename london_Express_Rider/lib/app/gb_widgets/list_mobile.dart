import 'package:amvines_rider_new/app/const/custom_themes.dart';
import 'package:flutter/material.dart';

class ListMobile extends StatelessWidget {
  final String? title, value;
  final VoidCallback press;
  const ListMobile({Key? key, this.title, this.value, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
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
            child: InkWell(
              onTap: press,
              child: Text(
                value!,
                style: CustomThemes().titleStyle.copyWith(
                    fontSize: 16,
                    wordSpacing: 1,
                    decoration: TextDecoration.underline,
                    color: Colors.green[900]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
