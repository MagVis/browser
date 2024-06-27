import 'package:browser/model/home_page_model.dart';
import 'package:browser/view/home/app_bar_home.dart';
import 'package:browser/view/home/web_view.dart';
import 'package:browser/view/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final model = HomeWidgetModel();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => model.goBack(),
      child: HomeWidgetProvider(
        model: model,
        child: Scaffold(
          appBar: AppBarHome(),
          body: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProgressBar(),
              WebView(),
            ],
          ),
        ),
      ),
    );
  }
}
