import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GetUI {
  Future<ResponseModel> getUI({String ip = ''}) async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://$ip:8000/loginFields'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(Duration(minutes: 1));

      return ResponseModel(
        statusCode: 00,
        title: 'Success',
        message: 'UI Gathered.',
        result: jsonDecode(utf8.decode(response.bodyBytes)),
        raw: response.body,
        hasError: false,
      );
    } on TimeoutException catch (e) {
      return ResponseModel(
        statusCode: 97,
        title: 'Request Timeout',
        message: 'Looks like the server is taking too long to respond, Please try again later.',
        result: e.toString(),
        hasError: false,
      );
    } on SocketException catch (e) {
      return ResponseModel(
        statusCode: 98,
        title: 'Server Error',
        message: 'Can\'t connect to server, this may be caused by either poor connectivity or an error with our servers.',
        result: e.toString(),
        hasError: true,
      );
    } on Error catch (e) {
      return ResponseModel(
        statusCode: 99,
        title: 'Uncaught Error',
        message: 'Something went wrong, You may send us a report to help us prevent this from happening.',
        result: e.toString(),
        hasError: true,
      );
    }
  }
}

class ResponseModel {
  final dynamic result;
  final String raw;
  final int statusCode;
  final String message;
  final String subMessage;
  final String title;
  final bool hasError;

  ResponseModel({
    this.result,
    this.hasError = false,
    this.statusCode = 00,
    this.title = '',
    this.message = '',
    this.subMessage = '',
    this.raw = '',
  });
}
