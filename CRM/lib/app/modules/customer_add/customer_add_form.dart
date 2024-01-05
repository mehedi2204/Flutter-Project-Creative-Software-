import 'package:flutter/material.dart';

class CustomerAddForm extends StatefulWidget {
  const CustomerAddForm({Key? key}) : super(key: key);

  @override
  State<CustomerAddForm> createState() => _CustomerAddFormState();
}

class _CustomerAddFormState extends State<CustomerAddForm> {
  TextEditingController _CustomerGrouptextFieldController = TextEditingController();
  String _CustomerGroupselectedOption = "Normal";
  TextEditingController _ProducttextFieldController = TextEditingController();
  String _ProductselectedOption = "Select Product";
  TextEditingController _BusinessRoletextFieldController = TextEditingController();
  String _BusinessRoleselectedOption = "Select Product";
  TextEditingController _TypeofBusinesstextFieldController = TextEditingController();
  String _TypeofBusinessselectedOption = "Proprietorship";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Customer'),
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
                  child: Text('Company: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                      hintText: 'Creative Software',
                    )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Customer Group: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    controller: _CustomerGrouptextFieldController,
                      onTap: () {
                        _CustomerGroupshowOptions(context);
                      },
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
                        hintText: '$_CustomerGroupselectedOption',
                        suffixIcon: IconButton(
                          onPressed: (){
                            _CustomerGroupshowOptions(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Product: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    onTap: () {
                      _ProductshowOptions(context);
                    },
                    controller: _ProducttextFieldController,
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
                          onPressed: (){
                            _ProductshowOptions(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      ),
                  )
              ),
              SizedBox(height: 20,),
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
                        hintText: "Enter member's business name",
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Customer Name: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Customer Full Name',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Business Role: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    onTap: () {
                      _BusinessRoleshowOptions(context);
                    },
                    controller: _BusinessRoletextFieldController,
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
                        hintText: 'Enter Customer No',
                        suffixIcon: IconButton(
                          onPressed: (){
                            _BusinessRoleshowOptions(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Type of Business: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
              SizedBox(height: 5,),
              Container(
                  child: TextField(
                    onTap: () {
                      _TypeofBusinessshowOptions(context);
                    },
                    controller: _TypeofBusinesstextFieldController,
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
                        hintText: '$_TypeofBusinessselectedOption',
                        suffixIcon: IconButton(
                          onPressed: (){
                            _TypeofBusinessshowOptions(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Trade License No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Trade license No',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Business Industries: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Business Industries',
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Number of Employees: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: '1-10',
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Business Age: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: '1-3',
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Total Investment: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Total Investment',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Mobile No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Mobile No',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Secondary Mobile No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter Secondary Mobile No',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Email: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                  child: Text('Gender: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Male',
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Date of Birth: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          onPressed: (){

                          },
                          icon: Icon(Icons.date_range, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('NID/PassPort No: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Enter National ID No',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Profession: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                        hintText: 'Business',
                        suffixIcon: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                        )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Religion: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Islam',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Country: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select Country',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('City: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select City',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Address: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Enter Present Village Name',
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Currency: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select Currency',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Language: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'Select Language',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Lead Sources: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'other',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Status: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'New',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.keyboard_arrow_down, color: Colors.deepPurple,),
                          )
                      )
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  child: Text('Assigned to: ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black54),)),
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
                          hintText: 'staff',
                          suffixIcon: IconButton(
                            onPressed: (){

                            },
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



// Customer Group Option
  void _CustomerGroupshowOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Normal'),
                onTap: () {
                  _CustomerGroupupdateTextField('Normal');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('High Budget'),
                onTap: () {
                  _CustomerGroupupdateTextField('High Budget');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Low Budget'),
                onTap: () {
                  _CustomerGroupupdateTextField('Low Budget');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('VIP'),
                onTap: () {
                  _CustomerGroupupdateTextField('VIP');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('WholeSaler'),
                onTap: () {
                  _CustomerGroupupdateTextField('WholeSaler');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _CustomerGroupupdateTextField(String value) {
    setState(() {
      _CustomerGroupselectedOption = value;
      _CustomerGrouptextFieldController.text = value;
    });
  }


  // Product Option
  void _ProductshowOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Courier Management Software'),
                onTap: () {
                  _ProductupdateTextField('Courier Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Customer Relationship Software'),
                onTap: () {
                  _ProductupdateTextField('Customer Relationship Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Diagnostic Management System'),
                onTap: () {
                  _ProductupdateTextField('Diagnostic Management System');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Education Management Software'),
                onTap: () {
                  _ProductupdateTextField('Education Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Freight forwarding Software'),
                onTap: () {
                  _ProductupdateTextField('Freight forwarding Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Hospital Management Software'),
                onTap: () {
                  _ProductupdateTextField('Hospital Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Micro Credit Management Software'),
                onTap: () {
                  _ProductupdateTextField('Micro Credit Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Parking Management Software'),
                onTap: () {
                  _ProductupdateTextField('Parking Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Pharmacy Management Software'),
                onTap: () {
                  _ProductupdateTextField('Pharmacy Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Fashion House Software'),
                onTap: () {
                  _ProductupdateTextField('Fashion House Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Footwear Shop Management Software'),
                onTap: () {
                  _ProductupdateTextField('Footwear Shop Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Point of sale system'),
                onTap: () {
                  _ProductupdateTextField('Point of sale system');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Prescription Management System'),
                onTap: () {
                  _ProductupdateTextField('Prescription Management System');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Restaurant Management Software'),
                onTap: () {
                  _ProductupdateTextField('Restaurant Management Software');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Website Development'),
                onTap: () {
                  _ProductupdateTextField('Website Development');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _ProductupdateTextField(String value) {
    setState(() {
      _ProductselectedOption = value;
      _ProducttextFieldController.text = value;
    });
  }


  // Business Role Option
  void _BusinessRoleshowOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Select business Role'),
                onTap: () {
                  _BusinessRoleupdateTextField('Select business Role');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Marketing Executive'),
                onTap: () {
                  _BusinessRoleupdateTextField('Marketing Executive');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Accounts Officer'),
                onTap: () {
                  _BusinessRoleupdateTextField('Accounts Officer');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Manager'),
                onTap: () {
                  _BusinessRoleupdateTextField('Manager');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('CEO'),
                onTap: () {
                  _BusinessRoleupdateTextField('CEO');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Director'),
                onTap: () {
                  _BusinessRoleupdateTextField('Director');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('General Manager'),
                onTap: () {
                  _BusinessRoleupdateTextField('General Manager');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Partner'),
                onTap: () {
                  _BusinessRoleupdateTextField('Partner');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Chairman'),
                onTap: () {
                  _BusinessRoleupdateTextField('Chairman');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Propritor'),
                onTap: () {
                  _BusinessRoleupdateTextField('Propritor');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _BusinessRoleupdateTextField(String value) {
    setState(() {
      _BusinessRoleselectedOption = value;
      _BusinessRoletextFieldController.text = value;
    });
  }


  // Type of Business Option
  void _TypeofBusinessshowOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Proprietorship'),
                onTap: () {
                  _TypeofBusinessupdateTextField('Proprietorship');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('PartnerShip'),
                onTap: () {
                  _TypeofBusinessupdateTextField('PartnerShip');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Limited Company'),
                onTap: () {
                  _TypeofBusinessupdateTextField('Limited Company');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _TypeofBusinessupdateTextField(String value) {
    setState(() {
      _TypeofBusinessselectedOption = value;
      _TypeofBusinesstextFieldController.text = value;
    });
  }
}






