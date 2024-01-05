import 'dart:io';

import 'package:amvines_rider_new/app/gb_widgets/button.dart';
import 'package:amvines_rider_new/app/modules/signup/model/DistrictResponse.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../const/app_constant.dart';
import '../../../const/custom_themes.dart';
import '../../../const/size_config.dart';
import '../../../gb_widgets/profile_pic.dart';
import '../controllers/signup_controller.dart';
import '../model/area_response.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConst.dPrimaryColor,
        title: const Text('Rider Registration'),
        centerTitle: true,
      ),
      body: Obx(() => SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHight! * 0.04), // 4%
                    Text("Rider Registration".tr,
                        style: AppColorsConst.headingStyle),
                    Text(
                      "${"Complete your details and continue".tr}\n${"with Email Password".tr}",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHight! * 0.04),
                    Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          ProfilePic(
                            press: () {
                              //getImage();
                              controller.getImage(1);
                            },
                            profileUrl: null,
                            edit: true,
                            image: controller.profile.value,
                          ),
                          buildNameFormField(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildEmailFormField(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildPhoneFormField(
                              controller.phoneConttroller.value),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Father Info*',
                                textAlign: TextAlign.start,
                                style: CustomThemes().cardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          buildFathersNameFormField(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildPhoneFormField(
                              controller.fathersPhoneConttroller.value),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Address*',
                                textAlign: TextAlign.start,
                                style: CustomThemes().cardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Expanded(
                                  child: buildTypesWidgets('Select Branch')),
                              // Expanded(
                              //     child: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: buildTypesAreaWidgets('Area'),
                              // )),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildAddressFormField(
                              controller.presentAddressConttroller.value,
                              'Present',
                              'present'),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildAddressFormField(
                              controller.permanentAddressConttroller.value,
                              'Permanent',
                              'permanent'),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Your NID Info*',
                                textAlign: TextAlign.start,
                                style: CustomThemes().cardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          buildIdCard(controller.selfNidNoConttroller.value,
                              'Your', '', controller.nidSelf.value, () {
                            controller.getImage(2);
                          }),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Your Fathers NID Info*',
                                textAlign: TextAlign.start,
                                style: CustomThemes().cardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          buildIdCard(
                              controller.fathersNidNoConttroller.value,
                              'Your Fathers',
                              'fathers',
                              controller.nidFather.value, () {
                            controller.getImage(3);
                          }),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            children: [
                              Text(
                                'Password*',
                                textAlign: TextAlign.start,
                                style: CustomThemes().cardTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          buildPasswordFormField(),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          buildConformPassFormField(),
                          SizedBox(height: getProportionateScreenHeight(30)),
                          Text(
                            '${'By continuing your confirm that you agree'.tr} \n${'with our Term and Condition'.tr}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          CustomButtton(
                              press: () {
                                controller.getCheckValidation();
                              },
                              title: 'Create')
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHight! * 0.04),

                    SizedBox(height: getProportionateScreenHeight(30)),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
        controller: controller.conpassCConttroller.value,
        obscureText: controller.obsText1.value,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value!.isEmpty) {
            return "Required*".tr;
          } else if (controller.passConttroller.value.text != value) {
            return "Not Matching".tr;
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Confirm Password".tr,
          hintText: "Re-enter your password".tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
            onTap: () {
              Get.find<SignupController>().obsText1.value =
                  !Get.find<SignupController>().obsText1.value;
            },
            child: SizedBox(
              child: controller.obsText1.value == false
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.hide_source_sharp),
            ),
          ),
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: controller.passConttroller.value,
      obscureText: controller.obsText.value,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required*".tr;
        } else if (value.length < 6) {
          return "Up to 6 charecters".tr;
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password".tr,
          hintText: "Enter your password".tr,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
            onTap: () {
              Get.find<SignupController>().obsText.value =
                  !Get.find<SignupController>().obsText.value;
            },
            child: SizedBox(
              child: controller.obsText.value == false
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.hide_source_sharp),
            ),
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: controller.emailConttroller.value,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required*".tr;
        } else if (!AppColorsConst.emailValidatorRegExp.hasMatch(value)) {
          AppColorsConst.dInvalidEmailError;
          return AppColorsConst.dInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email".tr,
        hintText: "Enter email".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.email,
          color: AppColorsConst.dPrimaryColor,
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: controller.nameConttroller.value,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required*".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name".tr,
        hintText: "Enter name".tr,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.person,
          color: AppColorsConst.dPrimaryColor,
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField(TextEditingController mycontroller) {
    return TextFormField(
      controller: mycontroller,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.length != 11) {
          return "Invalid Phone*".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone".tr,
        hintText: "Enter phone".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.phone,
          color: AppColorsConst.dPrimaryColor,
        ),
      ),
    );
  }

  TextFormField buildFathersNameFormField() {
    return TextFormField(
      controller: controller.fatharsNameConttroller.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required*".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Fathers Name ".tr,
        hintText: "Enter fathers name".tr,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.format_color_text_sharp,
          color: AppColorsConst.dPrimaryColor,
        ),
      ),
    );
  }

  Column buildTypesWidgets(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<Branch>(
            //isDense: true,
            hint: controller.selectValue != null
                ? Text(
                    controller.selectValue!.name!,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    'Select'.tr,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
            value: controller.selectValue,

            icon: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey[600],
              ),
            ),
            iconSize: 30,
            elevation: 16,
            isExpanded: true,
            style: const TextStyle(
              color: Colors.black,
            ),
            underline: Container(
              height: 0,
            ),
            onChanged: (Branch? newValue) {
              //addressListControler.onSetDemo(newValue!);
              controller.selectValue = newValue;
              // controller.getDisstrictWiseAreList(
              //     subArea: newValue!.name.toString());
            },
            items: controller.distList
                .map<DropdownMenuItem<Branch>>((Branch? value) {
              return DropdownMenuItem<Branch>(
                value: value,
                child: Text(
                  '${value!.name}',
                  style: CustomThemes().titleStyle,
                ),
              );
            }).toList(),
          ),
        ),
        Container(height: 1, width: SizeConfig.screenWidth, color: Colors.grey)
      ],
    );
  }

  Column buildTypesAreaWidgets(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        DropdownButton<AreaResponse>(
          //isDense: true,
          hint: controller.selectAreaValue != null
              ? Text(
                  controller.selectAreaValue!.area!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              : Text(
                  'Select'.tr,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
          value: controller.selectAreaValue,

          icon: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey[600],
            ),
          ),
          iconSize: 30,
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(
            color: Colors.black,
          ),
          underline: Container(
            height: 0,
          ),
          onChanged: (AreaResponse? newValue) {
            //addressListControler.onSetDemo(newValue!);
            controller.selectAreaValue = newValue;
          },
          items: controller.dataAreaList
              .map<DropdownMenuItem<AreaResponse>>((AreaResponse? value) {
            return DropdownMenuItem<AreaResponse>(
              value: value,
              child: Text(
                '${value!.area}',
                style: CustomThemes().titleStyle,
              ),
            );
          }).toList(),
        ),
        Container(height: 1, width: SizeConfig.screenWidth, color: Colors.grey)
      ],
    );
  }

  Card buildIdCard(TextEditingController controller, String hint1, String hint2,
      File url, VoidCallback press) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return "Required*".tr;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "$hint1 NID No".tr,
              hintText: "Enter your $hint2 nid no".tr,
              // floatingLabelBehavior:
              //     FloatingLabelBehavior.always,
              // suffixIcon: const CustomSurffixIcon(
              //     svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: SizeConfig.screenWidth! * 0.45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: AppColorsConst.dPrimaryGradientColor),
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAlias,
              children: [
                if (url.path == '10')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/id.json',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                if (url.path != '10')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.file(
                        url,
                        fit: BoxFit.fill,
                        height: SizeConfig.screenWidth! * 0.38,
                        width: SizeConfig.screenWidth! * 0.65,
                      ),
                    ),
                  ),
                Positioned(
                    bottom: 6,
                    right: 6,
                    child: InkWell(
                      onTap: press,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.deepOrange),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildAddressFormField(
      TextEditingController controller, String hint1, String hint2) {
    return TextFormField(
      controller: controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return "Required*".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),

        labelText: "$hint1 Address".tr,
        hintText: "Enter your home $hint2 address".tr,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(
          Icons.location_city_rounded,
          color: AppColorsConst.dPrimaryColor,
        ),
        //D:\Project\amvines_rider\assets\icons\Location point.svg
      ),
    );
  }
}
