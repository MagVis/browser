import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidgetModel extends ChangeNotifier {
  final _controller = WebViewController();
  bool _isPageLoad = false;
  double _progressBar = 0;
  String? searchText;
  Uri? uri;

  double get progress => _progressBar;
  WebViewController get controller => _controller;

  void search() {
    _isPageLoad = false;
    notifyListeners();
  }

  void goHome() {
    _isPageLoad = false;
    searchText = null;
    notifyListeners();
  }

  Future<void> goBack() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
    notifyListeners();
  }

  Future<void> goForward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
    notifyListeners();
  }

  Future<void> reload() async {
    await _controller.reload();
    notifyListeners();
  }

  Uri getReadyUrl() {
    if (searchText == null) {
      return Uri.parse('https://www.google.com/');
    } else {
      final matchCaseOne = RegExp(
              "^(http[s]?:\\/\\/(www\\.)?|ftp:\\/\\/(www\\.)?|www\\.){1}([0-9A-Za-z-\\.@:%_+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?",
              caseSensitive: false)
          .firstMatch(searchText!);
      final matchCaseTwo = RegExp(
              "^([0-9A-Za-z-\\.@:%_+~#=]+)+((\\.[a-zA-Z]{2,3})+)(/(.)*)?(\\?(.)*)?",
              caseSensitive: false)
          .firstMatch(searchText!);
      if (matchCaseOne != null || matchCaseTwo != null) {
        if (searchText!.startsWith('http://') ||
            searchText!.startsWith('https://')) {
          uri = Uri.parse(searchText!);
        } else {
          uri = Uri.parse('https://${searchText!}');
        }
      } else {
        uri = Uri.parse('https://www.google.com/search?q=$searchText');
      }
      return uri ?? Uri.parse('https://www.google.com/');
    }
  }

  WebViewController getController() {
    if (_isPageLoad == false) {
      _isPageLoad = true;
      _controller.loadRequest(getReadyUrl());
    }
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (request) {
          if (uri != Uri.parse(request)) {
            uri = Uri.parse(request);
            searchText = request;
            notifyListeners();
          }
        },
        onProgress: (progress) {
          _progressBar = progress / 100;
          notifyListeners();
        },
      ),
    );
    return _controller;
  }
}

class HomeWidgetProvider extends InheritedNotifier<HomeWidgetModel> {
  const HomeWidgetProvider({
    super.key,
    required HomeWidgetModel? model,
    required super.child,
  }) : super(notifier: model);

  static HomeWidgetModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HomeWidgetProvider>()
        ?.notifier;
  }

  static HomeWidgetModel? read(BuildContext context) {
    final element = context
        .getElementForInheritedWidgetOfExactType<HomeWidgetProvider>()
        ?.widget;
    return element is HomeWidgetProvider ? element.notifier : null;
  }
}
