import 'dart:convert';
import 'package:tahafuz/models/PhishTankResult.dart';
import 'package:xml/xml.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class URLScanner extends StatelessWidget {
  final String urlString;
  URLScanner(this.urlString);
  Future<bool> getFromXML(BuildContext context, String urlVal) async {
    HttpClient httpClient = new HttpClient();
    final url = Uri.parse(
        'https://checkurl.phishtank.com/checkurl/index.php?url=$urlVal');
    final request = await httpClient.getUrl(url);
    final response = await request.close();
    final stream = response.transform(utf8.decoder);
    final contents = await stream.join();
    final document = XmlDocument.parse(contents);
    var elements = document.findAllElements("url0");

    try {
      List<PhishTankResult> phishTankResults = elements.map((element) {
        return PhishTankResult(
            element.findElements("in_database").first.text,
            element.findElements("verified").first.text,
            element.findElements("valid").first.text);
      }).toList();
      if (phishTankResults[0].inDatabase == 'true' &&
          phishTankResults[0].verified == 'true' &&
          phishTankResults[0].valid == 'true') {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } catch (e) {
      print('Error');
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
