import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, color: Colors.white, size: 80, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                ),
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),),
                      Text('Shakil Khan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.work, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Designation: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),),
                      Text('Software Engineer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),),
                      Text('shakil@gmail.com', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.mobile_friendly, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Number: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),),
                      Text('01931899923', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info, color: Colors.lightGreen, size: 30, shadows: [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))]),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),),
                      Text('I am a software engineer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Logout', style: TextStyle(fontSize: 16),),
                    ), style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                )),
              )
            ]
          ),
        ),
      )
    );
  }
}

