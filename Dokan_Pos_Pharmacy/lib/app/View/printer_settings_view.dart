import 'dart:ui';
import 'package:dokan_pos/app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrinterSettingsView extends StatelessWidget {
  const PrinterSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.print,
                            color: Colors.white,
                            size:
                            MediaQuery.of(context).size.width / 4.5),
                        const SizedBox(height: 10),
                        Text("Printer Settings",
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width /
                                    15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: PortSelectionWidget(),
                  ),
                ),
              ),
              //const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      children: [
                        PaperWidth(),
                        SizedBox(
                          height: 15,
                        ),
                        PrinterSelect(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//For Bluetooth Connection
class BluetoothController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future scanDevices() async {
    flutterBlue.startScan(timeout: Duration(seconds: 15));
    flutterBlue.stopScan();

    if (await flutterBlue.isOn) {
      print('Bluetooth is already turned on.');
      return true;
    } else {
      print('Bluetooth is not turned on.');
    }
  }

  Stream<List<ScanResult>> get scanResults => flutterBlue.scanResults;
}

//For Bluetooth port Type Selection state
class PortSelectionWidget extends StatefulWidget {
  @override
  _PortSelectionWidgetState createState() => _PortSelectionWidgetState();
}

class _PortSelectionWidgetState extends State<PortSelectionWidget> {
  String? _selectedPortType = 'Bluetooth'; // Default selected option

  void _onPortTypeSelected(String? portType) {
    setState(() {
      _selectedPortType = portType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Port Type',
          style: TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioOption('Bluetooth'),
            SizedBox(width: 20),
            _buildRadioOption('USB'),
            SizedBox(width: 20),
            _buildRadioOption('WiFi'),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioOption(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: title,
          groupValue: _selectedPortType,
          onChanged: _onPortTypeSelected,
          activeColor: Colors.deepPurple,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

//For Paper Width Selection state for device paper size
class PaperWidth extends StatefulWidget {
  @override
  _PaperWidthState createState() => _PaperWidthState();
}

class _PaperWidthState extends State<PaperWidth> {
  String? _selectedPortType = '80mm'; // Default selected option

  void _onPortTypeSelected(String? portType) {
    setState(() {
      _selectedPortType = portType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Paper Width',
          style: TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioOption('80mm'),
            SizedBox(width: 80),
            _buildRadioOption('56mm'),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
        //   child: Text(
        //     'Selected Port Type: $_selectedPortType',
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildRadioOption(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: title,
          groupValue: _selectedPortType,
          onChanged: _onPortTypeSelected,
          activeColor: Colors.deepPurple,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}






//For Printer Selection after Bluetooth Device is connected
class PrinterSelect extends StatefulWidget {
  @override
  _PrinterSelectState createState() => _PrinterSelectState();
}


// final LoanController loanController = Get.find();
// // Access the loan collection data using the controller's variables
// int accountNumber = loanController.accountNumber.value;
// String name = loanController.name.value;
// String fathersName = loanController.fathersName.value;
// String mobile = loanController.mobile.value;
// int installmentAmount = loanController.installmentAmount.value;
// int loanAmount = loanController.loanAmount.value;
// int totalCollection = loanController.totalCollection.value;
// int balance = loanController.balance.value;
// String loanCollectionNumber = loanController.loanCollectionNumber.value;

class _PrinterSelectState extends State<PrinterSelect> {
  List<ScanResult> _devicesList = [];
  BluetoothDevice? _selectedDevice;
  SharedPreferences? _prefs;
  bool _isLoading = true;
  bool _isConnected = false;
  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _writeCharacteristic;


  void initState() {
    super.initState();
    if (!_isConnected) {
      _initBluetooth();
    }
  }

  _initBluetooth() async {
    try {
      FlutterBlue.instance.state.listen((state) async {
        if (state == BluetoothState.on) {
          _discoverDevices();
          //_loadSavedDevice();
        } else if (state == BluetoothState.off) {
          // Show a dialog or a message to guide the user to enable Bluetooth manually.
          // For example, you can use showDialog or a SnackBar.
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Bluetooth is Off'),
              content: Text(
                  'Please enable Bluetooth in your device settings to continue.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      });
      setState(() {
        _isLoading = false;
      });
    } catch (ex) {
      print("Error initializing Bluetooth: $ex");
      Fluttertoast.showToast(
        msg: "Error initializing Bluetooth: $ex",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _discoverDevices() {
    if (!_isConnected) {
      FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
      FlutterBlue.instance.scanResults.listen((results) {
        setState(() {
          _devicesList = results;
        });
      });
    }
  }

  _loadSavedDevice() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      String? savedDeviceAddress = _prefs!.getString('device_address');
      if (savedDeviceAddress != null) {
        BluetoothDevice? device = _devicesList
            .map((result) => result.device)
            .firstWhere((device) => device.id.id == savedDeviceAddress);
        setState(() {
          _selectedDevice = device;
        });
      }
    } catch (ex) {
      print("Error loading saved device: $ex");
      Fluttertoast.showToast(
        msg: "Error loading saved device: $ex",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  _saveSelectedDevice() async {
    try {
      if (_selectedDevice != null) {
        await _prefs!.setString('device_address', _selectedDevice!.id.id);
      }
    } catch (ex) {
      print("Error saving selected device: $ex");
      Fluttertoast.showToast(
        msg: "Error saving selected device: $ex",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }


  Future<void> _connectToDevice() async {
    try {
      if (_selectedDevice == null) {
        Fluttertoast.showToast(
          msg: "Please select a printer to connect.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        return;
      }

      FlutterBlue flutterBlue = FlutterBlue.instance;
      _connectedDevice = _selectedDevice;

      // Connect to the Bluetooth device using the provided PIN code
      await _connectedDevice!.connect(autoConnect: true, timeout: Duration(seconds: 5));

      // Get the services and characteristics for writing data
      List<BluetoothService> services = await _connectedDevice!.discoverServices();

      for (BluetoothService service in services) {
        List<BluetoothCharacteristic> characteristics = service.characteristics;
        for (BluetoothCharacteristic characteristic in characteristics) {
          // Replace 'YOUR_CHARACTERISTIC_UUID' with the UUID of the characteristic that supports write
          if (characteristic.properties.write) {
            _writeCharacteristic = characteristic;
            break;
          }
        }
      }

      if (_writeCharacteristic != null) {

        // Set the connection status to true
        setState(() {
          _isConnected = true;
        });

        Fluttertoast.showToast(
          msg: "Device connected successfully.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error: Write characteristic not found.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (ex) {
      print("Error connecting to the printer: $ex");
      Fluttertoast.showToast(
        msg: "Error connecting to the printer: $ex",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<void> _printInvoice() async {
    try {

      FlutterBlue flutterBlue = FlutterBlue.instance;
      _connectedDevice = _selectedDevice;

      // Connect to the Bluetooth device using the provided PIN code
      //await _connectedDevice!.connect(autoConnect: true, timeout: Duration(seconds: 10));

      // Get the services and characteristics for writing data
      List<BluetoothService> services = await _connectedDevice!.discoverServices();

      for (BluetoothService service in services) {
        List<BluetoothCharacteristic> characteristics = service.characteristics;
        for (BluetoothCharacteristic characteristic in characteristics) {
          // Replace 'YOUR_CHARACTERISTIC_UUID' with the UUID of the characteristic that supports write
          if (characteristic.properties.write) {
            _writeCharacteristic = characteristic;
            break;
          }
        }
      }

      if (_writeCharacteristic != null) {
        String invoiceMessage = "Loan Collection Invoice\n";
        // invoiceMessage += "Account Number: $accountNumber\n";
        // invoiceMessage += "Name: $name\n";
        // invoiceMessage += "Father's Name: $fathersName\n";
        // invoiceMessage += "Mobile: $mobile\n";
        // invoiceMessage += "Installment Amount: $installmentAmount\n";
        // invoiceMessage += "Loan Amount: $loanAmount\n";
        // invoiceMessage += "Total Collection: $totalCollection\n";
        // invoiceMessage += "Balance: $balance\n";
        // invoiceMessage += "Loan Collection Number: $loanCollectionNumber\n\n\n\n";

        List<int> bytes = invoiceMessage.codeUnits;
        await _writeCharacteristic!.write(bytes);

        Fluttertoast.showToast(
          msg: "Invoice printed successfully.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error: Write characteristic not found.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (ex) {
      print("Error connecting to the printer: $ex");
      Fluttertoast.showToast(
        msg: "Error connecting to the printer: $ex",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }


  void dispose() {
    // Disconnect the Bluetooth device when navigating back
    _disconnectFromDevice();
    super.dispose();
  }


  Future<void> _disconnectFromDevice() async {
    try {
      if (_connectedDevice != null) {
        // Disconnect from the device
        await _connectedDevice!.disconnect();
        _connectedDevice = null;
        _writeCharacteristic = null;

        // Set the connection status to false
        setState(() {
          _isConnected = false;
        });

        Fluttertoast.showToast(
          msg: "Device disconnected.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }
    } catch (ex) {
      print("Error disconnecting from the printer: $ex");
      Fluttertoast.showToast(
        msg: "Disconnecting from the printer",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    int isClose = 0;
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Printer',
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 240,
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white30,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<BluetoothDevice>(
                          value: _selectedDevice,
                          onChanged: (BluetoothDevice? device) {
                            setState(() {
                              _selectedDevice = device;
                            });
                          },
                          items: [
                            if (_selectedDevice == null)
                              DropdownMenuItem<BluetoothDevice>(
                                value: null,
                                child: Text('Select Device'),
                              ),
                            ..._devicesList.map<DropdownMenuItem<BluetoothDevice>>(
                                  (result) {
                                return DropdownMenuItem<BluetoothDevice>(
                                  value: result.device,
                                  child: Text(result.device.name),
                                );
                              },
                            ).toList(),
                          ],
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ),


                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : GestureDetector(
                        onTap: () => _initBluetooth(),
                        child: Container(
                          height: 50,
                          // width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: isClose == 1
                                  ? Colors.green
                                  : Colors.deepPurple,
                              border: Border.all(
                                  width: 2, color: Colors.grey[600]!),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(Icons.search),
                                AppText(
                                  text: 'Scan',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: isClose == 1
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (_isConnected) {
                          _disconnectFromDevice();
                        } else {
                          _connectToDevice();
                          //_saveSelectedDevice();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: _isConnected ? Colors.red : Colors.deepPurple,
                          border: Border.all(width: 2, color: Colors.grey[600]!),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: _isConnected ? 'Disconnect' : 'Connect',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color:
                                _isConnected ? Colors.white : Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () => _printInvoice(),
                      child: Container(
                        height: 50,
                        // width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: isClose == 0
                                ? Colors.deepPurple
                                : Colors.transparent,
                            border: Border.all(
                                width: 2, color: Colors.grey[600]!),
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.search),
                              AppText(
                                text: 'Test Print',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: isClose == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}