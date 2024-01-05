import 'dart:io';

import 'package:amvines_rider_new/app/const/app_constant.dart';
import 'package:amvines_rider_new/app/const/base_url.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../const/size_config.dart';

class ProfilePic extends StatelessWidget {
  final bool? edit;
  final String? profileUrl;
  final VoidCallback? press;
  final File? image;
  const ProfilePic(
      {Key? key,
      required this.edit,
      required this.profileUrl,
      required this.press,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(80),
      width: getProportionateScreenWidth(80),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        // overflow: Overflow.visible,
        children: [
          SizedBox(
            child: image!.path != '10'
                ? CircleAvatar(
                    backgroundImage: FileImage(image!),
                  )
                : SizedBox(
                    child: profileUrl == null
                        ? CircleAvatar(
                            child: Lottie.asset("assets/lottie/profile.json",
                                fit: BoxFit.fill),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${BaseUrl.basedUrl}/public/photo/${profileUrl!}',
                                scale: 1),
                          ),
                  ),
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: SizedBox(
              height: 20,
              width: 20,
              child: InkWell(
                onTap: press,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 248, 209, 209))),
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                 
                  onPressed: press,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: AppColorsConst.dPrimaryColor,
                    ),
                  ),
                  // child: SvgPicture.asset(edit!
                  //     ? 'assets/icons/Plus Icon.svg'
                  //     : "assets/icons/star.svg"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
