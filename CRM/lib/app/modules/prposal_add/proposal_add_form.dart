import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Product {
  String item;
  String description;
  int qty;
  double amount;

  Product({required this.item, required this.description, required this.qty, required this.amount});
}

class ProposalAddForm extends StatefulWidget {
  const ProposalAddForm({Key? key}) : super(key: key);

  @override
  State<ProposalAddForm> createState() => _ProposalAddFormState();
}

class _ProposalAddFormState extends State<ProposalAddForm> {
  List<Product> products = [];
  double subtotal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Proposal'),
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
                      child: Text('Date: ', style: TextStyle(
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
                            hintText: 'mm/dd/yyyy',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_month,
                                color: Colors.deepPurple,),
                            )
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Open Till: ', style: TextStyle(
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
                            hintText: 'mm/dd/yyyy',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_month,
                                color: Colors.deepPurple,),
                            )
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('To: ', style: TextStyle(
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
                            hintText: 'Enter related to name',
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
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Active',
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
                      child: Text('Assigned: ', style: TextStyle(
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
                  Container(
                      child: Text('Subject: ', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black54),)),
                  SizedBox(height: 5,),
                  Container(
                      child: TextField(
                        //enabled: false,
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
                            hintText: 'Enter Subject Name',
                            //hintStyle: TextStyle(color: Colors.black),
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Business Name: ', style: TextStyle(
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
                      child: Text('Address: ', style: TextStyle(
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
                          hintText: '',
                        ),
                        maxLines: 3,
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
                              hintText: 'Select Currency',
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
                      child: Text('City: ', style: TextStyle(
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
                            hintText: 'Enter City',
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Container(
                      child: Text('Tag: ', style: TextStyle(
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
                            hintText: 'Select Tag',
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
                                borderSide: BorderSide(
                                    color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2),
                              ),
                              hintText: 'Select Country',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down,
                                  color: Colors.deepPurple,),
                              )
                          )
                      )
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black, thickness: 1,),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      itemCount: products.length + 1,
                      // +1 for the "Add Product" button
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          // This is the "Add Product" button
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder
                                        (borderRadius: BorderRadius.circular(30)),
                                  ),
                                  onPressed: _showAddProductDialog,
                                  child: Text('Add Item', style: TextStyle(
                                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600
                                  ))),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Text(
                                          "Print",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(Colors.blueGrey),
                                          foregroundColor:
                                          MaterialStateProperty.all(Colors.white),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                          ),
                                      ),
                                    ),
                                  ),
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
                                ],
                              ),
                            ],
                          );
                        } else {
                          // Display product information
                          Product product = products[index];
                          double totalAmount = product.qty * product.amount;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    //spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  )
                                ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                                'Item: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                'Description: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                'Qty: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                'Amount: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                'Total Amount: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 40,),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                                product.item,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                product.item,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                product.qty.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                product.amount.toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                                totalAmount.toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         child: Text(
                  //           'Sub Total: ',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             fontSize: 18,
                  //             color: Colors.black,
                  //           )
                  //         ),
                  //       ),
                  //       Container(
                  //         child: TextField(
                  //           decoration: InputDecoration(
                  //             border: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: Colors.deepPurple, width: 5
                  //               )
                  //             )
                  //           )
                  //         ),
                  //       ),
                  //     ],
                  //   )
                  // ),
                ]
            ),
          ),
        )
    );
  }


  void _showAddProductDialog() {
    Product newProduct = Product(
        item: '', description: '', qty: 0, amount: 0.0);
    double totalAmount = 0.0;

    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              title: Center(child: Text('Add Item')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Item', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54)),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2,
                              ),
                            ),
                            hintText: 'Enter Item',
                            suffixIcon: IconButton(
                              splashRadius: 20,
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down),
                            )
                          ),
                          onChanged: (text) {
                            newProduct.item = text;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54)),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            //color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ]
                    )
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantity', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54)),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2,
                                ),
                              ),
                              hintText: 'Enter Quantity',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            newProduct.qty = int.tryParse(text) ?? 0;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Amount', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black54)),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 5,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 2,
                                ),
                              ),
                              hintText: 'Enter Amount',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            newProduct.amount = double.tryParse(text) ?? 0.0;
                            totalAmount = newProduct.qty * newProduct.amount;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Add the new product to the list
                      products.add(newProduct);
                      // Update subtotal
                      subtotal += totalAmount;
                    });
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text('Add', style: TextStyle(
                        color: Colors.white,
                      ))
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




