import 'package:flutter/material.dart';

class EmailAddForm extends StatefulWidget {
  const EmailAddForm({Key? key}) : super(key: key);

  @override
  State<EmailAddForm> createState() => _EmailAddFormState();
}

class _EmailAddFormState extends State<EmailAddForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Email'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text('Business Name: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                      hintText: 'Select Business Name',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                      )
                    )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Mobile No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                        hintText: 'Enter Mobile No',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Display Reminder: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      enabled: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                        hintText: 'Yes',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Email Reminder: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                        hintText: 'Yes',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Private: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    onTap: () {},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                        hintText: 'Yes',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Address: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: 'Enter your Address',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Email: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: 'Enter Email',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Website: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: 'Enter Website',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Email Type: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      onTap: () {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: 'Select Email Type',
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Follow Up Email Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: 'mm/dd/yyyy',
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.calendar_month, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Follow Up Email Time: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple, width: 5),
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
                          hintText: '--:-- --',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.watch_later_outlined, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      "Submit",
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
      )
    );
  }
}






