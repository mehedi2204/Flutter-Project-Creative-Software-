import 'package:crm/app/modules/dashboard/view/dashboard_view.dart';
import 'package:crm/app/modules/signin/view/admin_signin_with_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin_email_signin_api_controller.dart';
import '../../../routes/app_pages.dart';

class AdminSignInView extends StatefulWidget {
  const AdminSignInView({Key? key}) : super(key: key);

  @override
  State<AdminSignInView> createState() => _AdminSignInViewState();
}

class _AdminSignInViewState extends State<AdminSignInView> {

  final LoginController _loginController = Get.put(LoginController());

  bool isPasswordVisible = false;
  void toggleOldPasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

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
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
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
                        SizedBox(height: 10,),
                        Text('Admin', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500, color: Colors.deepPurple),),
                        SizedBox(height: 50,),
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: TextField(
                                    onChanged: (value) => _loginController.email.value = value,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.email, color: Colors.deepPurple,),
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
                                      hintText: 'Enter your email',
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: TextField(
                                    obscureText: !isPasswordVisible,
                                    onChanged: (value) => _loginController.password.value = value,
                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          onTap: toggleOldPasswordVisibility,
                                          child: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.deepPurple, )),
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
                                      hintText: 'Enter your password',
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
                                    Get.to(SignInWithNumber());
                                  },
                                  child: Text('Sign In with Number', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.deepPurple, decoration: TextDecoration.underline),)),
                              InkWell(
                                  onTap: () {},
                                  child: Text('Forgot Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.deepPurple, decoration: TextDecoration.underline),)),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _loginController.login(),
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
                        SizedBox(height: 20,),
                        Obx(()
                        {
                          return _loginController.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : SizedBox();
                        }
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
