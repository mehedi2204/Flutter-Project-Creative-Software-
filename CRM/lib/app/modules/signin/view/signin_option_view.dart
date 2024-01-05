import 'package:crm/app/modules/dashboard/view/dashboard_view.dart';
import 'package:crm/app/modules/signin/view/admin_signin_view.dart';
import 'package:crm/app/modules/signin/view/admin_signin_with_number.dart';
import 'package:crm/app/modules/signin/view/customer_signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignInOptionView extends StatefulWidget {
  const SignInOptionView({Key? key}) : super(key: key);

  @override
  State<SignInOptionView> createState() => _SignInOptionViewState();
}

class _SignInOptionViewState extends State<SignInOptionView> {
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
                          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/crm_logo.jpg'),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Sign In', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                          SizedBox(height: 10,),
                          Text('as', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.deepPurple),),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AdminSignInView(),
                                    ));
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                        border: Border.all(
                                            width: 0, color: Colors.grey[600]!),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          // Icon(Icons.search),
                                          Text(
                                            'Admin',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(CustomerSignInView());
                                  },
                                  child: Container(
                                    height: 50,
                                    // width: MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        border: Border.all(
                                            width: 0, color: Colors.grey[600]!),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(60))),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          // Icon(Icons.search),
                                          Text(
                                            'Customer',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          )
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
