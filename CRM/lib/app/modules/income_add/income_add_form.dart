import 'package:flutter/material.dart';

class IncomeAddForm extends StatefulWidget {
  const IncomeAddForm({Key? key}) : super(key: key);

  @override
  State<IncomeAddForm> createState() => _IncomeAddFormState();
}

class _IncomeAddFormState extends State<IncomeAddForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
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
                  child: Text('Issue Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'mm/dd/yyyy',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.calendar_month, color: Colors.deepPurple,),
                        )
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Voucher Category: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                      hintText: 'Select Voucher Category',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                      )
                    )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Amount',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Note: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Note',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Income Voucher No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    enabled: false,
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
                        hintText: 'IVN202310043',
                        hintStyle: TextStyle(color: Colors.black),
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Description: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Description',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Payment Type: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Select Payment Type',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
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






