import 'package:flutter/material.dart';
class WebView extends StatefulWidget {
String url;
WebView(this.url);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return WebView(widget.url);
  }
}
