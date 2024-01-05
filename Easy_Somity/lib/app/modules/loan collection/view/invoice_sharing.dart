import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class InvoiceForm extends StatefulWidget {
  @override
  _InvoiceFormState createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<InvoiceItem> _invoiceItems = [];

  void _addItem() {
    setState(() {
      _invoiceItems.add(InvoiceItem(name: "Item", price: 0));
    });
  }

  void _removeItem(int index) {
    setState(() {
      _invoiceItems.removeAt(index);
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in _invoiceItems) {
      total += item.price;
    }
    return total;
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save user information and other data to a model
      InvoiceData data = InvoiceData(
        name: _nameController.text,
        address: _addressController.text,
        email: _emailController.text,
        items: _invoiceItems,
      );

      // Now you can navigate to the InvoiceViewScreen and pass the data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceViewScreen(data: data),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: "Address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _invoiceItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_invoiceItems[index].name),
                      subtitle: Text("Price: \$${_invoiceItems[index].price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addItem,
                  child: Text("Add Item"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Generate Invoice"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InvoiceItem {
  String name;
  double price;

  InvoiceItem({required this.name, required this.price});
}

class InvoiceData {
  String name;
  String address;
  String email;
  List<InvoiceItem> items;

  InvoiceData({
    required this.name,
    required this.address,
    required this.email,
    required this.items,
  });
}

class InvoiceViewScreen extends StatelessWidget {
  final InvoiceData data;

  InvoiceViewScreen({required this.data});

  double _calculateTotal() {
    double total = 0;
    for (var item in data.items) {
      total += item.price;
    }
    return total;
  }

  Future<void> _savePdf() async {
    final pdf = pw.Document();

    final ttf = await rootBundle.load("assets/NotoSans-Black.ttf");
    final font = pw.Font.ttf(ttf);

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Invoice for ${data.name}", style: pw.TextStyle(font: font)),
            pw.Text("Address: ${data.address}", style: pw.TextStyle(font: font)),
            pw.Text("Email: ${data.email}", style: pw.TextStyle(font: font)),
            pw.SizedBox(height: 20),
            pw.Text("Items:", style: pw.TextStyle(font: font)),
            for (var item in data.items)
              pw.Container(
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(item.name),
                    pw.Text("Price: \$${item.price}", style: pw.TextStyle(font: font)),
                  ],
                ),
              ),
            pw.SizedBox(height: 20),
            pw.Text("Total: \$${_calculateTotal()}", style: pw.TextStyle(font: font)),
          ],
        ),
      ),
    );

    final directory = await getExternalStorageDirectory();
    final path = "${directory?.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf";
    final file = await File(path).writeAsBytes(await pdf.save());

    print(Text("PDF saved at ${file.path}"));

    // Share the PDF file using the flutter_share package
    // await FlutterShare.shareFile(
    //   title: 'Invoice for ${data.name}',
    //   text: 'Invoice for ${data.name}',
    //   filePath: file.path,
    // );
    await Share.shareFiles([file.path], text: 'Invoice for ${data.name}');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Invoice for ${data.name}"),
            Text("Address: ${data.address}"),
            Text("Email: ${data.email}"),
            SizedBox(height: 20),
            Text("Items:"),
            for (var item in data.items)
              ListTile(
                title: Text(item.name),
                subtitle: Text("Price: \$${item.price}"),
              ),
            SizedBox(height: 20),
            Text("Total: \$${_calculateTotal()}"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _savePdf,
            child: Icon(Icons.save),
          ),
          SizedBox(width: 16),
          // FloatingActionButton(
          //   onPressed: _shareFile,
          //   child: Icon(Icons.share),
          // ),
        ],
      ),
    );
  }
}
