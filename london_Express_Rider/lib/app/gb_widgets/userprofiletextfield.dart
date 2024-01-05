


import 'package:flutter/material.dart';

import '../const/custom_themes.dart';
import '../const/size_config.dart';

class UserProfileTextField extends StatelessWidget {
  const UserProfileTextField({
    Key? key,
    required TextEditingController name,
    required this.readOnly,
    required this.lebelText,
    required this.icon,
    required this.press,
  })  : _name = name,
        super(key: key);

  final TextEditingController _name;
  final bool? readOnly;
  final String? lebelText;
  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: _name,
      
      style: CustomThemes()
          .titleStyle
          .copyWith(fontSize: getProportionateScreenWidth(16)),
      autofocus: false,
      readOnly: readOnly!,
      decoration: InputDecoration(
        hintStyle: CustomThemes()
            .detailsTextStyle
            .copyWith(fontSize: getProportionateScreenWidth(10)),
        icon: Icon(icon!),
        labelText: lebelText,
      ),
      onTap: press,
    );
  }
}
