import 'package:browser/model/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = HomeWidgetProvider.watch(context);
    return Expanded(child: WebViewWidget(controller: model!.getController()));
  }
}
