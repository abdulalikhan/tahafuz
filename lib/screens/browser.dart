import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:tahafuz/components/URLScanner.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tahafuz/models/MenuList.dart';
import 'package:url_launcher/url_launcher.dart';

import 'QuickLaunch.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = 'http://www.google.com';
  URLScanner urlScanner = URLScanner('http://www.google.com');
  bool result;
  bool connectionStatus = true;

  Future<String> getQuickLaunch(BuildContext context) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
            builder: (context) => QuickLaunch(),
          ) ??
          'http://www.google.com',
    );
  }

  launchUrl() async {
    if (!(controller.text.startsWith('http://') ||
        controller.text.startsWith('https://'))) {
      controller.text = 'http://' + controller.text;
    }
    setState(() {
      urlString = controller.text;
      urlScanner = URLScanner(urlString);
    });
    result = await urlScanner.getFromXML(context, urlString);
    if (result) {
      print('Warning');
      flutterWebviewPlugin.hide();
      Alert(
        context: context,
        image: Image.asset(
          "assets/tahafuz.png",
          height: 250,
          width: 250,
        ),
        closeFunction: () {
          flutterWebviewPlugin.show();
        },
        title: "WARNING",
        desc:
            "The website that you are trying to access has been reported as a phishing website.",
        buttons: [
          DialogButton(
            child: Text(
              "CLOSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              flutterWebviewPlugin.show();
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          )
        ],
      ).show();
    } else {
      flutterWebviewPlugin.reloadUrl(urlString);
    }
  }

  goBack() {
    flutterWebviewPlugin.goBack();
  }

  reloadUrl() {
    flutterWebviewPlugin.reload();
  }

  FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvsc) {
      print(wvsc.type);
    });
    flutterWebviewPlugin.onUrlChanged.listen((String newUrl) async {
      urlScanner = URLScanner(urlString);
      result = await urlScanner.getFromXML(context, urlString);
      if (result) {
        print('Warning');
        flutterWebviewPlugin.goBack();
        flutterWebviewPlugin.hide();
        Alert(
          context: context,
          closeFunction: () {
            flutterWebviewPlugin.show();
          },
          title: "Threat Blocked",
          image: Image.asset(
            "assets/tahafuz.png",
            height: 250,
            width: 250,
          ),
          desc:
              "The webpage that you are trying to access has been reported as a phishing website.",
          buttons: [
            DialogButton(
              child: Text(
                "CLOSE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                flutterWebviewPlugin.show();
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            )
          ],
        ).show();
      } else {
        controller.text = newUrl;
        if (newUrl.contains('.pdf')) {
          launch(newUrl);
        }
      }
    });
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
    _focusNode.dispose();
  }

  Future<void> choiceAction(String choice) async {
    if (choice == MenuList.clearCookies) {
      flutterWebviewPlugin.cleanCookies();
      flutterWebviewPlugin.show();
      flutterWebviewPlugin.evalJavascript('alert("Cookies Cleared!");');
    } else if (choice == MenuList.clearCache) {
      flutterWebviewPlugin.clearCache();
      flutterWebviewPlugin.show();
      flutterWebviewPlugin.evalJavascript('alert("Cache Cleared!");');
    } else if (choice == MenuList.quickLaunch) {
      flutterWebviewPlugin.hide();
      String newUrl = await getQuickLaunch(context);
      flutterWebviewPlugin.show();
      setState(() {
        controller.text = newUrl;
      });
      launchUrl();
    } else if (choice == MenuList.exit) {
      flutterWebviewPlugin.clearCache();
      flutterWebviewPlugin.cleanCookies();
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => goBack(),
        ),
        title: TextField(
          onTap: () {
            flutterWebviewPlugin.hide();
          },
          onEditingComplete: () {
            flutterWebviewPlugin.show();
            _focusNode.unfocus();
          },
          focusNode: _focusNode,
          autofocus: false,
          controller: controller,
          cursorColor: Colors.white,
          cursorWidth: 0.3,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) {
            _focusNode.unfocus();
            launchUrl();
          },
          style: TextStyle(
            color: Colors.white,
          ),
          enableInteractiveSelection: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter URL Here',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => launchUrl(),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => reloadUrl(),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              flutterWebviewPlugin.evalJavascript(
                  'alert("Tahafuz is Pakistan\'s first secure mobile web browser. It blocks malicious websites that may attempt to steal your information.");');
            },
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            onCanceled: () {
              flutterWebviewPlugin.show();
            },
            itemBuilder: (BuildContext context) {
              flutterWebviewPlugin.hide();
              return MenuList.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      url: urlString,
      withZoom: true,
    );
  }
}
