import 'package:flutter/material.dart';
import 'package:flutter_barcode_listener_plus/flutter_barcode_listener_plus.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final BarcodeController _barcodeController = BarcodeController();

  final List<String> _scannedValues = ["Nitesh", "Rajkumar", "1234567890"];

  @override
  void initState() {
    _scannedValues.add("Nitesh");
    _barcodeController.stream.listen((values) {
      try {
        if (values.isNotEmpty) {
          _scannedValues.add(values);
          setState(() {});
        }
      } catch (_) {}

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Scanned value from stream: $values")));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BarcodeListener(
      bufferDuration: Duration(seconds: 2),
      controller: _barcodeController,
      child: Scaffold(
        appBar: AppBar(title: Text("Barcode Scanner")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scannedValues.clear();
            setState(() {});
          },
        ),
        body: Column(
          children: [
            TextFormField(),
            Expanded(
              child: ListView.builder(
                itemCount: _scannedValues.length,
                // shrinkWrap: true,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "Scanned value: ${_scannedValues[index]}",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      onScan: (value) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Scanned value from onScan: $value")));
        print("final scanned value is : $value");
      },
    );
  }
}
