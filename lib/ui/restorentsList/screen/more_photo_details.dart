import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zometo_clone/utils/consts/color_constant.dart';
class MorePhotoDetails extends StatefulWidget {
  String photoUrls;
  String restorentnName;
  MorePhotoDetails({this.photoUrls,this.restorentnName});
  @override
  _MorePhotoDetailsState createState() => _MorePhotoDetailsState();
}

class _MorePhotoDetailsState extends State<MorePhotoDetails> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.restorentnName,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: primaryColor,
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.

      ),
      body: WebView(
        initialUrl:widget.photoUrls,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
