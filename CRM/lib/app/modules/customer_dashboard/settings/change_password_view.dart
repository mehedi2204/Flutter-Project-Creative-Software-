import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reenterNewPasswordController = TextEditingController();

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isReenterPasswordVisible = false;
  bool newPasswordError = false;

  void toggleOldPasswordVisibility() {
    setState(() {
      isOldPasswordVisible = !isOldPasswordVisible;
    });
  }

  void toggleNewPasswordVisibility() {
    setState(() {
      isNewPasswordVisible = !isNewPasswordVisible;
    });
  }

  void toggleReenterPasswordVisibility() {
    setState(() {
      isReenterPasswordVisible = !isReenterPasswordVisible;
    });
  }

  void checkPasswordMatch() {
    if (newPasswordController.text != reenterNewPasswordController.text) {
      setState(() {
        newPasswordError = true;
      });
    } else {
      setState(() {
        newPasswordError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text('Change Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Old Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.8,
                                child: TextField(
                                  controller: oldPasswordController,
                                  obscureText: !isOldPasswordVisible,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: toggleOldPasswordVisibility,
                                        child: Icon(isOldPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.deepPurple, )),
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
                                    hintText: 'Enter Old Password',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('New Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.8,
                                child: TextField(
                                  controller: newPasswordController,
                                  obscureText: !isNewPasswordVisible,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: toggleNewPasswordVisibility,
                                        child: Icon(isNewPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.deepPurple,)),
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
                                    hintText: 'Enter New Password',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('Re-Enter New Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.8,
                                child: TextField(
                                  controller: reenterNewPasswordController,
                                  //onChanged: (_) => checkPasswordMatch(),
                                  keyboardType: TextInputType.number,
                                  obscureText: !isReenterPasswordVisible,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: toggleReenterPasswordVisibility,
                                        child: Icon(isReenterPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.deepPurple,)),
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
                                    hintText: 'Re-Enter New Password',
                                    errorText: newPasswordError ? 'Password does not match' : null,
                                    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(onPressed: () => checkPasswordMatch(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Change Password', style: TextStyle(fontSize: 16),),
                          ), style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          )),
                    ]
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}
