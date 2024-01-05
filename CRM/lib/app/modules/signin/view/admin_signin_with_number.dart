import 'package:crm/app/modules/signin/view/admin_signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/view/dashboard_view.dart';

class SignInWithNumber extends StatefulWidget {
  const SignInWithNumber({Key? key}) : super(key: key);

  @override
  State<SignInWithNumber> createState() => _SignInWithNumberState();
}

class _SignInWithNumberState extends State<SignInWithNumber> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/crm_logo.jpg'),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Sign In', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                          SizedBox(height: 50,),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mobile Number', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.mobile_friendly, color: Colors.deepPurple,),
                                        border: OutlineInputBorder(
                                          //borderSide: BorderSide(color: Colors.deepPurple, width: 5),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide(color: Colors.deepPurple),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                        ),
                                        hintText: 'Enter your mobile number',
                                      ),
                                    ),
                                  )
                                ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Get.to(AdminSignInView());
                                    },
                                    child: Text('Sign In with Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.deepPurple, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          SizedBox(height: 50,),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                //Get.toNamed(Routes.DASHBOARD);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => GetOTP(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  "Get OTP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.deepPurple),
                                  foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ))),
                            ),
                          ),
                        ]
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }
}


class GetOTP extends StatefulWidget {
  const GetOTP({Key? key}) : super(key: key);

  @override
  State<GetOTP> createState() => _GetOTPState();
}

class _GetOTPState extends State<GetOTP> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/crm_logo.jpg'),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Sign In', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                          SizedBox(height: 50,),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Enter OTP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width*0.8,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.security_update_warning, color: Colors.deepPurple,),
                                        border: OutlineInputBorder(
                                          //borderSide: BorderSide(color: Colors.deepPurple, width: 5),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide(color: Colors.deepPurple),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                        ),
                                        hintText: 'Enter OTP Code',
                                      ),
                                    ),
                                  )
                                ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Text('Resend', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.deepPurple, decoration: TextDecoration.underline),),
                                        Icon(Icons.refresh, color: Colors.deepPurple, size: 20,),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(height: 50,),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                //Get.toNamed(Routes.DASHBOARD);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DashboardView(),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.deepPurple),
                                  foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ))),
                            ),
                          ),
                        ]
                    ),
                  ),
                ]
            ),
          )
      ),
    );
  }
}

