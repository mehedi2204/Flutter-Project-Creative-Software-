import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SubscriptionAddForm extends StatefulWidget {
  const SubscriptionAddForm({Key? key}) : super(key: key);

  @override
  State<SubscriptionAddForm> createState() => _SubscriptionAddFormState();
}

class _SubscriptionAddFormState extends State<SubscriptionAddForm> {

  String _filePath = 'No file selected';
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  Future<void> _selectDate2 (BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }


  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.first.name ?? 'No file selected';
      });
    } else {
      setState(() {
        _filePath = 'No file selected';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstBillingDate = TextEditingController(text: "${selectedDate.toLocal()}".split(' ')[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subscription'),
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
                        hintText: 'Select Business Name',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                    ),
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Product: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                      hintText: 'Select Product',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                      )
                    )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Bill Amount: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: '',
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
                        hintText: 'Select Payment Type',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('First Billing Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    controller: _firstBillingDate,
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
                          onPressed: () => _selectDate(context),
                          icon: Icon(Icons.calendar_month, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Title: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: '',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Plan: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Select Plan',
                        suffixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Payment Mode: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select Payment Mode',
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Currency: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select Currency',
                          suffixIcon: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Bill Due Date: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    controller: TextEditingController(text: "${selectedDate2.toLocal()}".split(' ')[0]),
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
                            onPressed: () => _selectDate2(context),
                            icon: Icon(Icons.calendar_month, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Attatchment: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              InkWell(
                onTap: _pickFile,
                child: Container(
                    height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: _pickFile,
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(child: Text('Choose File', style: TextStyle(color: Colors.black, fontSize: 15),)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(_filePath, style: TextStyle(color: Colors.black, fontSize: 15),),
                      ]
                    ),
                  ),
                ),
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






