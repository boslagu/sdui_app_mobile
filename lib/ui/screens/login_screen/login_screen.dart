import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sd_ui_app/core/services/get_ui.dart';
import 'package:sd_ui_app/ui/shared/state_wrapper.dart';

import '../../../sdui/sdui_parser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Widget populatedFields = Container();
  static String label = 'Get UI';
  var uiData = '{"0":"1"}';
  TextEditingController ipController = TextEditingController();

  Future fields() async {
    GetUI getUI = GetUI();
    ResponseModel response = await getUI.getUI();

    setState(() {
      populatedFields = parseUIToJson(response.result);
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/login_ui.json');
  }

  Future<File> writeCounter() async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$uiData');
  }

  Future<Map<String, dynamic>> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      // If encountering an error, return 0
      print(e.toString());
      return jsonDecode('{"1":"0"}');
    }
  }

  @override
  void initState() {
    // fields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SDUI Sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: hexToColor('#000000')),
                ),
                child: TextField(
                  controller: ipController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Input IP',
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                GetUI getUI = GetUI();
                //'192.168.1.9'
                ResponseModel response = await getUI.getUI(
                  ip: ipController.text.isNotEmpty ? ipController.text : "192.168.1.9",
                );
                populatedFields = parseUIToJson(response.result);
                label = 'Update UI';
                uiData = response.raw;
                setState(() {});
                File myFile = await _localFile;
                if (await myFile.exists()) {
                  print('file exits');
                  var localUI = await readCounter();
                  if (localUI.toString().length > 8) {
                    print('no data');
                    if (response.result["data"]["version"] != localUI["data"]["version"]) {
                      print("save new UI");
                      await writeCounter();
                    }
                  } else {
                    await writeCounter();
                  }
                } else {
                  await writeCounter();
                }
              },
              child: Text(label),
            ),
            TextButton(
              onPressed: () async {
                await writeCounter();
              },
              child: const Text('Save UI'),
            ),
            TextButton(
              onPressed: () async {
                File myFile = await _localFile;
                if (await myFile.exists()) {
                  var data = await readCounter();
                  print(data);
                  if (data.toString().length > 8) {
                    populatedFields = parseUIToJson(data);
                    label = 'Update UI';
                    setState(() {});
                  }
                } else {
                  await writeCounter();
                }
              },
              child: const Text('Load UI'),
            ),
            populatedFields
          ],
        ),
      ),
    );
  }
}
