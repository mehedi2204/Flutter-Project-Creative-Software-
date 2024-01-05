import 'package:flutter/material.dart';

class LeadAddForm extends StatefulWidget {
  const LeadAddForm({Key? key}) : super(key: key);

  @override
  State<LeadAddForm> createState() => _LeadAddFormState();
}

class _LeadAddFormState extends State<LeadAddForm> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Lead'),
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
                      child: Text('Business Name: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Select Business Name',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Mobile No: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          onTap: () {},
                          enabled: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            hintText: 'Enter Mobile No',
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Country: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                        onTap: () {},
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            hintText: 'United States',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.deepPurple,),
                            )
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Currency: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: "Afghani",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Language: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Afrikanns',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Company: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          onTap: () {},
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Creative Software',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Customer Group: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          onTap: () {},
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Normal',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Customer Name: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            hintText: 'Enter Customer Name',
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Email: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            hintText: 'Enter Email',
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Address: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2),
                            ),
                            hintText: 'Enter Address',
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Lead Source: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Cold Call',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Status: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'New',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Product: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Courier Management Software',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Assigned to: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'staff',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
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






