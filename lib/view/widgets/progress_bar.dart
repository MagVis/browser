import 'package:browser/model/home_page_model.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = HomeWidgetProvider.watch(context);
    if (model?.progress == 1) {
      return SizedBox();
    } else {
      return LinearProgressIndicator(value: model?.progress);
    }
  }
}
