import 'dart:io';
import 'dart:ui';
import 'package:easy_somity/app/const/color_constant.dart';
import 'package:easy_somity/app/const/widgets/app_text.dart';
import 'package:easy_somity/app/modules/dashboard/controller/loan_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/widgets/custom_snakebar.dart';
import '../../dashboard/controller/dps_collection_view_api_controller.dart';
import '../../dashboard/controller/dps_report_api_controller.dart';
import '../../dashboard/controller/loan_collection_view_api_controller.dart';
import '../../dashboard/controller/loan_report_api_controller.dart';
import '../../signin/loginController.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


class DpsInvoiceViewPOSprint extends StatelessWidget {
  const DpsInvoiceViewPOSprint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int isClose = 0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: CustomColor.primary,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.print,
                            color: CustomColor.white,
                            size:
                            MediaQuery.of(context).size.width / 4.5),
                        const SizedBox(height: 10),
                        Text("DPS Collection Invoice Print",
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width /
                                    15,
                                color: CustomColor.white,
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
          activeColor: CustomColor.primary,
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
          activeColor: CustomColor.primary,
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

final DpsCollectionReportController controller = Get.put(DpsCollectionReportController());
final AuthController _authController = Get.put(AuthController());
final DpsCollectionController _dpsCollectionController =
Get.put(DpsCollectionController());


String apiDateTime = "${controller.data.value.createdAt}";


// Parse the API datetime string
DateTime parsedDateTime = DateTime.parse(apiDateTime);

// Format the date
String formattedDate = DateFormat.yMd().format(parsedDateTime);

// Format the time in 12-hour clock format with AM/PM
String formattedTime = DateFormat.jm().format(parsedDateTime);

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
    _initBluetooth();
    controller
        .fetchDpsCollectionReport('${_authController.user.value.accessToken}');
  }

  _initBluetooth() async {
    try {
      FlutterBlue.instance.state.listen((state) async {
        if (state == BluetoothState.on) {
          _discoverDevices();
          _loadSavedDevice();
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
        msg: "Error initializing Bluetooth",
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
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 4));
    FlutterBlue.instance.scanResults.listen((results) {
      setState(() {
        _devicesList = results;
      });
    });
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
      // Fluttertoast.showToast(
      //   msg: "Error loading saved device: $ex",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.CENTER,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      // );
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
        msg: "Error saving selected device",
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
        customSnakebar(
            title: 'Please select a Printer to connect',
            description: '',
            color: Colors.redAccent,
            icon: Icons.error);
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

        customSnakebar(
            title: 'Device connected successfully',
            description: '',
            color: Colors.deepPurple,
            icon: Icons.done);
      } else {
        customSnakebar(
            title: 'Invoice not Found',
            description: 'Try again',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (ex) {
      print("Error connecting to the printer: $ex");
      customSnakebar(
          title: 'Error connecting to the printer',
          description: 'Try again',
          color: Colors.redAccent,
          icon: Icons.error);
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

      if (_writeCharacteristic != null && controller.isLoading.value == false) {
        String invoiceMessage = "সহজ সঞ্চয় ও ঋণ দান সমবায় সমিতি\n";
        invoiceMessage += "Account Number:${controller.company.value.address ?? ''}\n";
        invoiceMessage += "Contact No:${controller.company.value.number ?? ''}\n\n";
        invoiceMessage += "Loan Collection Invoice\n\n";
        invoiceMessage += "Date:${formattedDate},          Time:${formattedTime}\n";
        invoiceMessage += "Account No:${controller.data.value.member!.memberNo ?? ''}\n";
        invoiceMessage += "Name:${controller.data.value.member!.memberName ?? ''}\n";
        invoiceMessage += "Father's Name:${controller.data.value.member!.membersFatherName ?? ''}\n";
        invoiceMessage += "Phone:${controller.data.value.member!.mobileNo ?? ''}\n";
        invoiceMessage += "DPS Collection Number:${controller.data.value.dpsCollectionNo ?? ''}\n\n";
        invoiceMessage += "Per Installment:${controller.amountPerInstallment.value.amountPerInstallment ?? '0.0'}\n";
        invoiceMessage += "Total Recieved:${_dpsCollectionController.dpsCollectionData.value.totalReceive}\n";
        invoiceMessage += "Today's Recieved:${controller.data.value.installmentCollection ?? '0.0'}\n";
        invoiceMessage += "Installment OverDue:${controller.data.value.installmentOverdue ?? '0.0'}\n";
        invoiceMessage += "Fine for Investment:${controller.data.value.fine ?? '0.0'}\n";
        invoiceMessage += "Collection Note:${controller.data.value.note ?? ''}\n\n\n\n";

        List<int> bytes = invoiceMessage.codeUnits;
        await _writeCharacteristic!.write(bytes);

        customSnakebar(
            title: 'Invoice Printed successfully',
            description: '',
            color: Colors.deepPurple,
            icon: Icons.done);
      } else {
        customSnakebar(
            title: 'Invoice not Found',
            description: 'Try again',
            color: Colors.redAccent,
            icon: Icons.error);
      }
    } catch (ex) {
      print("Error connecting to the printer: $ex");
      customSnakebar(
          title: 'Connect a Printer Device',
          description: '',
          color: Colors.redAccent,
          icon: Icons.error);
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
      // Fluttertoast.showToast(
      //   msg: "Error disconnecting from the printer",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.CENTER,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      // );
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
                            color: CustomColor.primary,
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
                                  ? CustomColor.dGreen
                                  : CustomColor.primary,
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
                                      ? CustomColor.white
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
                          _saveSelectedDevice();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: _isConnected ? Colors.red : CustomColor.primary,
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
                                _isConnected ? CustomColor.white : Colors.white,
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
                                ? CustomColor.white
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
                                text: 'Print',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: isClose == 0
                                    ? CustomColor.black
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